# Adversarial review — batch 200

## Scope

Mechanical (not human) re-extraction and cross-check of SpecialTaxCreditCap10000
and its independent Spec/Tests against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded.

### SpecialTaxCreditCap10000.lean — 地方税法 附則 第五条の十二 第四項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 地方税法 (law 325AC0000000226), revision
  325AC0000000226_20261101_508AC0000000002, enforced 2026-11-01.
- Source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
- 独立再抽出: walked `law_full_text` to `SupplProvision` Article `Num=5_12`,
  `Paragraph#4 / ParagraphSentence / Sentence#1` (source_path pinned in model
  header and transcription pin). The scoped article is 1,159 chars; the needle
  occurs in it exactly once. Negative controls on sibling articles `5_11`,
  `5_13`, `5` contain neither the needle nor 「一万」.
- 数値: 「一万円」 = 10000 (`int_to_kanji(10000) == 一万`);
  `clause_correspondence({10000}, needle, scoped) → True` with basis
  "spec numerals / rate ratio in clause"; a wrong literal (10000000) fails.
- 分岐: 「超える」 is strict — `incomePortion = 10000` takes the fallback branch
  (`exactly_ceiling_uses_fallback`), 9999 also fallback, 10001 uses the cap.
- 符号: `10000 − prefCredit` is computed on `Int`. The clause prescribes no
  floor; `negative_result_is_kept` proves a negative result is preserved rather
  than silently clamped to zero. This is the critical faithfulness point.
- 境界カテゴリ (mechanically detected): zero, small_input, threshold_below/at/
  above (9999/10000/10001), saturation (20000 with pref 10000 → 0).
  These are finite smoke checks; universal branch properties are proved.
- 独立仕様: specCeiling/specCredit use their own numerals and no implementation
  identifiers; agreeCeiling/agreeCredit are separate bridges (`rw`/`rfl`).
- 判定 (H/T/D/C/U): H（所得割一万円超なら一万円−道府県民税特別税額控除額、
  以下なら第二項第二号）, T（10000, 一万, bytes pinned）, D（rfl / simp / decide）,
  C（scoped needle 一意、strict 境界、符号保持、spec 独立性）,
  U（控除額・第二号額の算定、令和七年度該当性、他項・他附則、賦課徴収は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
