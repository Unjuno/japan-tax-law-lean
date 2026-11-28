# Adversarial review — SpecialTaxOrderArt80CapitalFeeFloor75k (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### SpecialTaxOrderArt80CapitalFeeFloor75k.lean — 租税特別措置法施行令 art.80(3) 第1号（株式会社）

Scope restriction: this model and its attestation apply **only to item 1 (株式会社, ¥75,000 floor)**.
Item 2 (合同会社) has a different ¥30,000 floor and is NOT modelled here; its norm unit must
remain unevidenced until a separate implementation/spec/attestation is provided. The evidence
pin therefore carries the exact item-1 `normative_id`.

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 332AC0000000026, revision
  `332AC0000000026_20261101_507AC0000000013`,
  `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
  SHA-256 recomputed: `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee`.
- Pinned needle located in scoped Article 80 Paragraph 3 Item 1 Column 2:
  「…資本金の額に千分の三・五を乗じて計算した金額（…七万五千円に満たない場合には、
  申請件数一件につき七万五千円）」
- Statutory literals: 三=3, 五=5 (三・五 = 3.5), 千=1000 (per-mille denominator),
  七万五千=75000 (floor); all in THIS clause; `spec_literals={3,5,10,1000,75000}`,
  clause correspondence True.
- Computation: impl `(3*10+5)/(1000*10)` = 35/10000 = 3.5/1000 with `if < 75000`;
  independent spec assembles its own numerator/denominator and uses `max`
  instead of `if`, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (fee floor), threshold_below (999/1000 vs 1001),
  threshold_at (1000/75000), threshold_above (1001). Finite grid,
  not a universal theorem.
- Rounding: Nat division (truncation) is assumed; its legal confirmation is
  NOT established.
- 監査 (H/T/D/C/U): H（資本金×3.5/1000、7.5万円未満なら一件7.5万円）,
  T（3・5/1000・75000、境界999/1000/1001・資本金20M/21M、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.80(3)、数値当該条項に存在、spec independence）,
  U（会社認定・申請件数の乗算・他号・免除・端数処理の法的確定は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
