#!/usr/bin/env python3
import shutil
from pathlib import Path

def aggregate_sh_files():
    # Target directory where this script is located
    base_dir = Path(__file__).parent.resolve()
    
    # Define output locations
    combined_file = base_dir / "all.sh"
    destination_dir = base_dir / "all_sh"
    
    # Create the destination folder if it doesn't exist
    destination_dir.mkdir(exist_ok=True)
    
    # Initialize/overwrite all.sh with a header
    with open(combined_file, "w", encoding="utf-8") as out_f:
        out_f.write("#!/usr/bin/env bash\n")
        out_f.write("# ==========================================\n")
        out_f.write("# Aggregated Shell Script Output\n")
        out_f.write("# ==========================================\n\n")

    # Locate all *.sh files recursively
    # Excludes the output file itself and files already inside the 'all_sh' folder
    sh_files = [
        p for p in base_dir.rglob("*.sh")
        if p.is_file() 
        and p != combined_file 
        and destination_dir not in p.parents
    ]

    if not sh_files:
        print("No .sh files found.")
        return

    print(f"Found {len(sh_files)} .sh file(s). Processing...\n")

    for file_path in sh_files:
        rel_path = file_path.relative_to(base_dir)
        
        # --- Task 1: Append contents to all.sh ---
        with open(combined_file, "a", encoding="utf-8") as out_f:
            out_f.write(f"\n# --- Source: {rel_path} ---\n")
            try:
                with open(file_path, "r", encoding="utf-8", errors="replace") as in_f:
                    out_f.write(in_f.read())
                out_f.write("\n")
            except Exception as e:
                print(f"Could not read {rel_path}: {e}")

        # --- Task 2: Copy file to all_sh folder ---
        # Flatten the path name (e.g., 'sub/test.sh' -> 'sub_test.sh') to prevent name collisions
        unique_name = "_".join(rel_path.parts)
        dest_file = destination_dir / unique_name

        shutil.copy2(file_path, dest_file)
        print(f"✓ Processed: {rel_path} -> all_sh/{unique_name}")

    print(f"\nDone! Combined file saved to: {combined_file.name}")
    print(f"Individual files copied to: {destination_dir.name}/")

if __name__ == "__main__":
    aggregate_sh_files()
