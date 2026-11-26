# Adversarial review — batch 216

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for CabinetOrderMattersDelegation.lean and its independent Spec/Tests
modules. Every claim below is reproducible from committed bytes.

### CabinetOrderMattersDelegation.lean — 必要事項の政令委任 第二条（前二項の読替的参照）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: law id 422AC1000000049, revision
  422AC1000000049_20101029_000000000000000
- Source: data/raw/422AC1000000049_20101029_000000000000000.law.json (6629 bytes)
- SHA-256: 16b8272006935c29d3aea9a0cdbc61d37416ec1b06934ab7ae1ea043fc9ce13a
  (SHA-256 再抽出 照合 OK, 独立再抽出バイト一致)
- Article Num: 2 (第二条). Scoped Article 2 (302 chars) に needle 1 箇所一致を照合。
- Needle verbatim in scoped Article 2:
  「前二項の規定の適用に関し必要な事項は、政令で定める。」
- 重要: 前二項の「二」は構造的な項参照 (which paragraphs), 実質的な閾値ではない。
  literal 2 = kanji 二 in 前二項; independent spec_literals = {2};
  source_literals_verified({2}, scoped) True; parse_statutory_rate is None.
  `appliesToParagraph` uses 2 only as an inclusive paragraph bound — never as
  an amount, rate, age, period, or any substantive threshold.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (1 = 2-1),
  threshold_at (2), threshold_above (3 = 2+1) — all kernel-decided examples.
- 独立仕様: specParagraphRef / specDelegated / specApplies defined without
  implementation identifiers; bridges are `unfold ... ; rfl` only
  (agreeParagraphRef, agreeDelegated, agreeApplies).
- 判定 (H/T/D/C/U): H（前二項の適用に関し必要な事項の政令委任という明示的 DELEGATION）,
  T（前二項 = 二, 構造的項参照・非閾値; bytes pinned by SHA-256）,
  D（rfl / by decide のみ, axiom/sorry なし）,
  C（needle verbatim, boundary categories complete, spec independence confirmed）,
  U（政令の具体的内容、前二項の実質、他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない
  (mechanical, not human)。
