# Adversarial review — batch 204

Mechanical (not human) re-extraction and cross-check of
ReconstructionCorpTaxMonthFloor against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### ReconstructionCorpTaxMonthFloor.lean — 復興特別法人税政令 第三条 第三項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 復興特別法人税に関する政令 (law 424CO0000000017), revision
  424CO0000000017_20240401_505CO0000000208.
- Source: data/raw/424CO0000000017_20240401_505CO0000000208.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=3`, `Paragraph#3`,
  `Sentence#1`; scoped article 1,886 chars. Needle
  「前項の月数は、暦に従って計算し、一月に満たない端数を生じたときは、これを切り捨てる。」
  occurs once in scoped article and once in the whole law; sibling paragraphs
  2, 4 and 5 do not contain it.
- 数値: 「一」 = 1 (`matched_spellings({1}) == {'1':['一']}`); the pinned-needle
  anchor is the correspondence basis because `spec_literals` treats 1 as
  structural. No other computation numeral is present.
- 境界: 「一月に満たない端数…切り捨て」 is a strict floor to whole months.
  The model takes an exact rational month count `numer/denom` and applies Nat
  floor: 1/2→0, 11/12→0, 12/12→1, 13/12→1, 31/32→0. This is the OPPOSITE of
  the already attested BusinessOwnerDeduction art.72の49の14(3) round-up rule.
- 端数処理: only the stated sub-month floor; no yen rounding is imported.
- 独立仕様: specFloorMonths is independent (a/b); agreeFloor is a separate rfl
  bridge.
- 判定 (H/T/D/C/U): H（暦に従った月数の一月未満端数を切り捨て）, T（1, 一, bytes
  pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、
  opposite-boundary 確認、spec 独立性）, U（暦計算の導出、1項課税年度選択、
  2項読替、税率・課税標準、他条、負の入力・分母零は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
