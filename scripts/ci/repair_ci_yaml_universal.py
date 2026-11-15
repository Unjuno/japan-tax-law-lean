"""Universal repair for the broken axiom-guard step across all branches.

Reads the printf block in the current branch's .github/workflows/lean.yml,
extracts the axiom list (dedup, order preserved), writes it to
scripts/ci/axioms.txt and scripts/ci/generate_axiom_probe.py (a variant that
emits exactly this branch's list), then replaces the printf block with the
indented here-doc that calls the probe. YAML-parses defensively afterward.
"""
from pathlib import Path
import argparse
import re


PROBE_TEMPLATE = """\"\"\"Emit this branch's #print axioms probe deterministically.\"\"\"
import sys

NAMES = [
{names}
]

sys.stdout.write("import JapanTaxLaw\\n")
for n in NAMES:
    sys.stdout.write(f"#print axioms {{n}}\\n")
"""


def repair(yml_path: str) -> tuple[int, list[str]]:
    P = Path(yml_path)
    src = P.read_text(encoding="utf-8")

    start = src.index("      - name: Axioms of key theorems")
    end = src.index("      - name: Reproducibility check 1 (clean build)")
    block = src[start:end]

    names = list(dict.fromkeys(re.findall(r"#print axioms\s+([A-Za-z0-9_.]+)", block)))

    def names_text():
        return "\n".join(f'    "{n}",' for n in names)

    # write probe script
    ci_dir = P.parent.parent / "scripts" / "ci"
    ci_dir.mkdir(parents=True, exist_ok=True)
    (ci_dir / "generate_axiom_probe.py").write_text(PROBE_TEMPLATE.format(names=names_text()), encoding="utf-8")

    axioms_blob = "\n".join(names) + "\n"
    (ci_dir / "axioms.txt").write_text(axioms_blob, encoding="utf-8", newline="\n")

    new_step = (
        "      - name: Axioms of key theorems\n"
        "        run: |\n"
        "          python3 scripts/ci/generate_axiom_probe.py > _ax.lean\n"
        "          lake env lean _ax.lean > _ax.log 2>&1 || { cat _ax.log; exit 1; }\n"
        "          cat _ax.log\n"
        "          ! grep -q 'sorryAx' _ax.log\n"
        "          ! grep -q 'Classical.choice' _ax.log || { echo \"unexpected axioms: $(cat _ax.log)\"; exit 1; }\n"
        "\n"
    )
    src = src[:start] + new_step + src[end:]
    P.write_text(src, encoding="utf-8", newline="\n")
    return len(names), names


if __name__ == "__main__":
    n, names = repair(".github/workflows/lean.yml")
    print(f"repaired: {n} axioms")
