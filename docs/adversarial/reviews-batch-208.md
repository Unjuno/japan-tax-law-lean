# Adversarial review — batch 208

Mechanical (not human) re-extraction and cross-check of
ResidualDistributionOneMonth against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### ResidualDistributionOneMonth.lean — 復興特別法人税に関する省令 第一条 第一項 第四号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 復興特別法人税に関する省令 (law 424M60000040007), revision
  424M60000040007_20210415_503M60000040045.
- Source: data/raw/424M60000040007_20210415_503M60000040045.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=1`, `Paragraph#1`,
  `Item#4`; scoped article 917 chars. Needle occurs once in scoped article and
  once in the whole law. Sibling items 1–3 and 5 lack both the needle and
  「一月以内」.
- 数値: 「一」 = 1 (`matched_spellings({1}) == {'1':['一']}`);
  `clause_correspondence({1}, needle, …)` True. Sole numeral in the cell.
- 期限: strict-after-FY-end and inclusive one-month gate on month ordinals:
  `fyEnd < dist ∧ dist ≤ fyEnd + 1`. Kernel-decided: 0→0 false, 0→1 true,
  0→2 false, 5→6 true, 5→7 false. Day-level/leap-day precision is out of scope.
- 独立仕様: specOneMonth/specWithin are independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（残余財産の最後の分配が終了日の翌日から一月以内なら
  その分配日）, T（1, 一, bytes pinned）, D（rfl / decide）, C（scoped needle
  一意、sibling negative、strict-after + inclusive-one-month 境界、spec 独立性）,
  U（課税事業年度・残余財産確定の定義、暦日計算、税額計算、他号・他条、
  法的結論は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
