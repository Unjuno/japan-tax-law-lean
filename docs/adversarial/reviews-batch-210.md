# Adversarial review — batch 210

Mechanical (not human) re-extraction and cross-check of
OneYearConstructionStartWindow against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### OneYearConstructionStartWindow.lean — 半島振興法施行令 第四条 第一項 第二号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 半島振興法施行令 (law 407M50000008012), revision
  407M50000008012_20050401_417M60000008064.
- Source: data/raw/407M50000008012_20050401_417M60000008064.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=4`, `Paragraph#1`,
  `Item#2 (固定資産税)`; scoped article 694 chars. Needle occurs once in scoped
  article; sibling item 1 (不動産取得税) uses different wording and lacks it.
- 数値: 「一」 = 1 (`matched_spellings({1}) == {'1':['一']}`);
  `clause_correspondence({1}, needle, …)` True. Genuine year count, not an
  article/fiscal-year label.
- 期限: TWO-SIDED land window: `recognDay <= acqDay ∧ acqDay < startDay ∧
  startDay <= acqDay + oneYearDays`. 「翌日から」 is strict (start on the
  acquisition day fails); 「一年以内」 is inclusive. Calendar-to-day conversion
  is caller-established (the clause fixes only the year count). Kernel-decided:
  acq 10/start 10 false, 11 true, 374 true, 375 true, 376 false (d=365);
  pre-certification acquisition false.
- 独立仕様: specYearCount/specEligibleLand independent; agree* use `rfl`.
- 判定 (H/T/D/C/U): H（認定日後取得の土地で取得翌日から一年以内に家屋建設着手）,
  T（1, 一, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling
  negative、two-sided 境界、spec 独立性）, U（認定日の法的判断、対象設備/
  家屋/償却資産の定義、不均一課税率・課税標準・賦課、1号、他条、暦計算は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
