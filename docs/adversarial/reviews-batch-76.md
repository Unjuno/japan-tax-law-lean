# Adversarial review — batch 76

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifacts for RegistrationTaxFloor1k.lean and its independent Spec/Tests modules.
This is a mechanical-not-human review: every claim below is reproducible from
committed bytes.

### RegistrationTaxFloor1k.lean — 登録免許税法 第十九条（計算額が千円に満たない場合の下限）

- 独立再抽出 (independent re-extraction) from 一次資料 (primary source):
  data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  SHA-256 = 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15
  Law id = 342AC0000000035; revision = 342AC0000000035_20261101_508AC0000000021
- Article Num = 19 (第十九条, MainProvision, Chapter 2). 判定: 照合 OK.
- Needle verbatim in scoped Article 19:
  「別表第一に掲げる登記又は登録につき同表に掲げる税率を適用して計算した金額が千円に満たない場合には、当該登記又は登録に係る登録免許税の額は、千円とする。」
- Statutory literal 1000 (千) confirmed in the needle; independent spec_literals = {1000}.
- Boundary categories kernel-decided in Tests: zero (0), small_input (1),
  threshold_below (999), threshold_at (1000), threshold_above (1001), saturation.
- Scope: ONLY the art.19 minimum-tax floor (max of computed amount and ¥1,000).
  The 別表第一 rates/fees live in other modules; this art.19 floor is distinct
  from those 別表 fee tables.
- Verdict: BY-DESIGN/CONFIRMED. H/T/D/C/U = H:0 T:0 D:0 C:0 U:0.
  H (harm): none — a statutory minimum. T (tampering): none — bytes pinned by hash.
  D (drift): none — literal re-extracted. C (coverage): complete for the floor.
  U (unresolved): none.
