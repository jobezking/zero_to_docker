#!/usr/bin/env python3
import shutil
from pathlib import Path

def get_unique_path(destination_dir: Path, base_filename: str) -> Path:
    """
    Guarantees a unique destination path by appending _1, _2, etc.
    before copying if a file with the same name already exists.
    """
    dest_file = destination_dir / base_filename
    if not dest_file.exists():
        return dest_file

    stem = dest_file.stem
    suffix = dest_file.suffix
    counter = 1

    while dest_file.exists():
        dest_file = destination_dir / f"{stem}_{counter}{suffix}"
        counter += 1

    return dest_file

def aggregate_and_copy_files():
    # Target directory where this script is located
    base_dir = Path(__file__).parent.resolve()
    
    # Output locations
    combined_file = base_dir / "all.sh"
    destination_dir = base_dir / "all_sh"
    
    # Create the destination folder if it doesn't exist
    destination_dir.mkdir(exist_ok=True)
    
    # Initialize/overwrite all.sh with a header
    with open(combined_file, "w", encoding="utf-8") as out_f:
        out_f.write("#!/usr/bin/env bash\n")
        out_f.write("# ==========================================\n")
        out_f.write("# Aggregated Shell Notes Output (*notes.sh)\n")
        out_f.write("# ==========================================\n\n")

    # Helper filter to ignore output files and self-referential directories
    def is_valid_source(path: Path) -> bool:
        return (
            path.is_file() 
            and path != combined_file 
            and destination_dir not in path.parents
        )

    # 1. Gather *notes.sh files (for Aggregation + Copying)
    notes_sh_files = [p for p in base_dir.rglob("*notes.sh") if is_valid_source(p)]

    # 2. Gather Dockerfiles (for Copying ONLY)
    docker_files = [p for p in base_dir.rglob("*Dockerfile*") if is_valid_source(p)]

    if not notes_sh_files and not docker_files:
        print("No matching *notes.sh or Dockerfile files found.")
        return

    print(f"Found {len(notes_sh_files)} *notes.sh file(s).")
    print(f"Found {len(docker_files)} Dockerfile(s).\n")

    # --- Process *notes.sh (Aggregate & Copy) ---
    for file_path in notes_sh_files:
        rel_path = file_path.relative_to(base_dir)
        
        # Aggregate into all.sh
        with open(combined_file, "a", encoding="utf-8") as out_f:
            out_f.write(f"\n# --- Source: {rel_path} ---\n")
            try:
                with open(file_path, "r", encoding="utf-8", errors="replace") as in_f:
                    out_f.write(in_f.read())
                out_f.write("\n")
            except Exception as e:
                print(f"Could not read {rel_path}: {e}")

        # Copy to all_sh directory with guaranteed unique name
        flattened_name = "_".join(rel_path.parts)
        dest_file = get_unique_path(destination_dir, flattened_name)
        
        shutil.copy2(file_path, dest_file)
        print(f"✓ Aggregated & Copied: {rel_path} -> all_sh/{dest_file.name}")

    # --- Process Dockerfiles (Copy ONLY with Unique Names) ---
    for file_path in docker_files:
        rel_path = file_path.relative_to(base_dir)
        
        # Copy to all_sh directory with guaranteed unique name
        flattened_name = "_".join(rel_path.parts)
        dest_file = get_unique_path(destination_dir, flattened_name)
        
        shutil.copy2(file_path, dest_file)
        print(f"✓ Copied (Docker only): {rel_path} -> all_sh/{dest_file.name}")

    print(f"\nDone!")
    print(f"Combined script: {combined_file.name}")
    print(f"Copied folder:   {destination_dir.name}/")

if __name__ == "__main__":
    aggregate_and_copy_files()