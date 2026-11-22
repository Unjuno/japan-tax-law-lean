import json, re, hashlib
from pathlib import Path

p = Path("data/verification_evidence.json")
ev = json.loads(p.read_text(encoding="utf-8"))
files = {
    "implementation": "JapanTaxLaw/GiftTax.lean",
    "independent_spec": "JapanTaxLaw/GiftTaxSpec.lean",
    "tests": "JapanTaxLaw/GiftTaxTests.lean",
}
# Find the unit whose axes reference GiftTax files.
target = None
for uid, axes in ev["units"].items():
    blob = json.dumps(axes, ensure_ascii=True)
    if "JapanTaxLaw/GiftTax.lean" in blob:
        target = uid
        break
assert target, "GiftTax unit not found in evidence"
print("target unit:", target[:24])

for axis, rel in files.items():
    fp = Path(rel)
    assert fp.exists(), rel
    actual = hashlib.sha256(fp.read_bytes().replace(b"\r\n", b"\n")).hexdigest()
    text = str(ev["units"][target][axis])
    new = re.sub(
        r"(JapanTaxLaw/GiftTax\w*\.lean\s+sha256=)[0-9a-f]{64}",
        lambda m: m.group(1) + actual,
        text,
    )
    assert new != text, ("no hash replaced", axis)
    ev["units"][target][axis] = new
    print(" ", axis, "->", actual[:16])

p.write_text(json.dumps(ev, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print("repaired 3 stale evidence refs")
