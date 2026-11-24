# Adversarial review — SpecialTonnageArt10PenaltyCap (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### SpecialTonnageArt10PenaltyCap.lean — 特別とん税法 art.10(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 332AC0000000038, revision
  `332AC0000000038_20250601_504AC0000000068`,
  `data/raw/332AC0000000038_20250601_504AC0000000068.law.json`.
  SHA-256 recomputed: `5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669`.
- Pinned needle located in scoped Article Num 10 Paragraph 1
  (`.../Article:10/Article#10/Paragraph#1/ParagraphSentence/Sentence#1`):
  「…三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する。」
- Statutory literals: 三=3 (years), 五十万=500,000 (yen), both in THIS clause;
  `spec_literals={3,500000}`, clause correspondence True.
- Computation: impl `termYears <= 3 && fineYen <= 500000`; independent spec
  uses `! (specMaxTerm < termYears)` and `! (specMaxFine < fineYen)` with its
  own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1/2/3/4),
  threshold_below (2 years / 499,999 yen), threshold_at (3 / 500,000),
  threshold_above (4 / 500,001). The finite grid is a counterexample check,
  not a universal theorem.
- 監査 (H/T/D/C/U): H（脱税者は3年以下の拘禁刑又是50万円以下の罰金）,
  T（三=3、五十万=500000、境界2/3/4 と 499999/500000/500001、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.10(1)、数値当該条項に存在、spec independence）,
  U（併科の選択・科刑裁量・犯罪成立・未遂(§2)・徴収(§3)は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only;
  the whole article is NOT claimed as verified.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
