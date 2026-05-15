import json
import os
from openpyxl import Workbook
from openpyxl.styles import PatternFill, Font

# =========================================================
# CONFIG
# =========================================================
BUILD_ID = os.environ.get("BUILD_BUILDID", "")
INPUT_FILE = "resources.json"
OUTPUT_DIR = "output"
OUTPUT_FILE = f"{OUTPUT_DIR}/Resource_List_Hexa_Training.xlsx"

# =========================================================
# LOAD AZURE RESOURCES
# =========================================================
if not os.path.exists(INPUT_FILE):
    raise FileNotFoundError("resources.json not found. Ensure AzureCLI task ran successfully.")

with open(INPUT_FILE, "r") as f:
    resources = json.load(f)

# =========================================================
# EXCEL SETUP
# =========================================================
wb = Workbook()
ws = wb.active
ws.title = "Azure Resources"

headers = [
    "S No.",
    "Resource Group Name",
    "Resource Name",
    "Resource Type",
    "ENV",
    "Status"
]

ws.append(headers)

# Styling
header_font = Font(bold=True)
new_fill = PatternFill(start_color="00C853", end_color="00C853", fill_type="solid")  # green
bold_font = Font(bold=True)

for col in range(1, len(headers) + 1):
    ws.cell(row=1, column=col).font = header_font

# =========================================================
# PROCESS RESOURCES
# =========================================================
for index, res in enumerate(resources, start=1):

    name = res.get("name", "")
    rg = res.get("rg", "")
    rtype = res.get("type", "")
    tags = res.get("tags") or {}

    env = tags.get("env", "")
    resource_build_id = str(tags.get("buildId", ""))

    status = "New" if resource_build_id == str(BUILD_ID) and BUILD_ID != "" else "Existing"

    row = [
        index,
        rg,
        name,
        rtype,
        env,
        status
    ]

    ws.append(row)

    current_row = ws.max_row

    # =========================================================
    # STYLE NEW RESOURCES
    # =========================================================
    if status == "New":
        for col in range(1, len(headers) + 1):
            cell = ws.cell(row=current_row, column=col)
            cell.fill = new_fill
            cell.font = bold_font

# =========================================================
# SAVE FILE
# =========================================================
os.makedirs(OUTPUT_DIR, exist_ok=True)
wb.save(OUTPUT_FILE)

print(f"Excel report generated at: {OUTPUT_FILE}")