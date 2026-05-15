import json
import os
from openpyxl import Workbook
from openpyxl.styles import PatternFill, Font

# =========================================================
# CONFIG
# =========================================================
BUILD_ID = os.environ.get("BUILD_BUILDID", "")

INPUT_FILE = "output/resources.json"

OUTPUT_DIR = "output"

OUTPUT_FILE = f"{OUTPUT_DIR}/Resource_List_Hexa_Training.xlsx"

# =========================================================
# LOAD AZURE RESOURCES
# =========================================================
if not os.path.exists(INPUT_FILE):
    raise FileNotFoundError(
        f"{INPUT_FILE} not found. Ensure AzureCLI task ran successfully."
    )

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

# =========================================================
# STYLING
# =========================================================
header_font = Font(bold=True)

new_fill = PatternFill(
    start_color="00C853",
    end_color="00C853",
    fill_type="solid"
)

bold_font = Font(bold=True)

for col in range(1, len(headers) + 1):
    ws.cell(row=1, column=col).font = header_font

# =========================================================
# PROCESS RESOURCES
# =========================================================
for index, res in enumerate(resources, start=1):

    name = res.get("name", "")

    rg = res.get("resourceGroup", "")

    rtype = res.get("type", "")

    env = res.get("env", "")

    resource_build_id = str(res.get("buildId", ""))

    status = (
        "New"
        if resource_build_id == str(BUILD_ID)
        and BUILD_ID != ""
        else "Existing"
    )

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

    # =====================================================
    # STYLE NEW RESOURCES
    # =====================================================
    if status == "New":

        for col in range(1, len(headers) + 1):

            cell = ws.cell(row=current_row, column=col)

            cell.fill = new_fill

            cell.font = bold_font

# =========================================================
# AUTO COLUMN WIDTH
# =========================================================
for column_cells in ws.columns:

    length = max(len(str(cell.value or "")) for cell in column_cells)

    adjusted_width = length + 5

    ws.column_dimensions[
        column_cells[0].column_letter
    ].width = adjusted_width

# =========================================================
# SAVE FILE
# =========================================================
os.makedirs(OUTPUT_DIR, exist_ok=True)

wb.save(OUTPUT_FILE)

print(f"Excel report generated at: {OUTPUT_FILE}")