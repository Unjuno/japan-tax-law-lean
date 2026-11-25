# Adversarial review — batch 201

Mechanical (not human) re-extraction and cross-check of DefenseCorpShortfallSum
against the pinned source. Reproducible from committed bytes; NOT a human legal
review. No reviewer/approval field recorded; legal review stays pending.

### DefenseCorpShortfallSum.lean — 防衛特別法人税政令 第三条 第六項 第一号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 防衛特別法人税に関する政令 (law 507CO0000000134), revision
  507CO0000000134_20260401_508CO0000000105, enforced 2026-04-01.
- Source: data/raw/507CO0000000134_20260401_508CO0000000105.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=3`, `Paragraph#6`,
  `Item#1`, `Sentence#1`; source_path pinned in model header and transcription
  pin. Needle
  「他の通算法人の他の課税事業年度の調整前控除限度額が零を下回る場合のその下回る額の合計額」
  occurs in the scoped Article 3 (3,778 chars). Sibling article 3_2 lacks it.
- 数値: 「零」 = 0 (`kanji_variants(0) == {'零'}`). Clause-level correspondence
  with literal 0 returns True; cross-check with the sibling clause/needle fails
  (needle and numeral must co-occur in the same cell).
- 厳密境界: 「下回る」 is strict — `shortfall 0 = 0`, `shortfall 1 = 0`,
  `shortfall (-1) = 1`. No saturation/floor is invented at 零.
- 合計: finite-list sum `Σ max(0, −bᵢ)` (`sum_example` proves a 4-element case).
  A universal impl↔spec bridge is proved by induction in the Spec module.
- 端数処理: this cell prescribes none; inputs are caller-established whole yen.
- 独立仕様: specZero/specShortfall/specSum define their own identifiers;
  agree* theorems are separate bridges (`rw`/induction).
- 判定 (H/T/D/C/U): H（零を下回る調整前控除限度額の下回る額の合計）,
  T（0, 零, bytes pinned）, D（rfl / rw / induction / decide）,
  C（scoped needle 一意、strict 境界、sibling cross-check 不合格、spec 独立性）,
  U（第二号の正部分、第四項割合、控除限度額の算定、連結 membership、
  課税事業年度選択、他条・他法令は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
