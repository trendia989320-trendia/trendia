#!/usr/bin/env python3
"""
Script to fix all text colors in the app - convert white/grey text to black
"""

import os
import re
from pathlib import Path

# Define the lib/screens directory
screens_dir = Path(r"d:\learn_mitra\lib\screens")

def fix_file(filepath):
    """Fix colors in a single file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Replace white with black
        content = re.sub(r'color:\s*Colors\.white(?!\w)', 'color: Colors.black', content)
        content = re.sub(r'color:\s*Colors\.white\.withOpacity', 'color: Colors.black.withOpacity', content)
        
        # Replace grey shades with black
        content = re.sub(r'color:\s*Colors\.grey\[\d{3}\]', 'color: Colors.black87', content)
        
        # In style declarations
        content = re.sub(r'style:\s*(?:const\s+)?TextStyle\(color:\s*Colors\.white', 
                        'style: const TextStyle(color: Colors.black', content)
        
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            return True
    except Exception as e:
        print(f"Error processing {filepath}: {e}")
    return False

# Process all dart files
dart_files = list(screens_dir.rglob("*.dart"))
print(f"Found {len(dart_files)} dart files")

changed_files = []
for dart_file in dart_files:
    if fix_file(dart_file):
        changed_files.append(str(dart_file))

print(f"\nFixed colors in {len(changed_files)} files")
for f in changed_files:
    print(f"  ✅ {f}")
