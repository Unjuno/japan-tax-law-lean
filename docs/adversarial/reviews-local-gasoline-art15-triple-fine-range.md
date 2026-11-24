# Adversarial review — LocalGasolineArt15TripleFineRange (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Every claim below was
re-derived from committed pinned bytes; this is not a human legal review.

### LocalGasolineArt15TripleFineRange.lean — 地方揮発油税法 art.15(4)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 330AC0000000104, revision
  `330AC0000000104_20260401_508AC0000000012`,
  `data/raw/330AC0000000104_20260401_508AC0000000012.law.json`.
  SHA-256 recomputed from the committed file:
  `c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a`.
- Pinned needle re-extracted verbatim and located in scoped Article Num 15,
  Paragraph 4 (source path `.../Article#15/Paragraph#4/ParagraphSentence/Sentence#1`):
  「…金額の三倍が五十万円を超える場合には、情状により、同項の罰金は、
  五十万円を超え…三倍以下とすることができる。」
- Statutory literals: 三 = 3 and 五十万 = 500,000. Both occur in THIS clause.
  `spec_literals={3, 500000}`; `source_literals_verified` True against the
  scoped clause (no rate-ratio shortcut).
- Computation: `triple a = 3 * a` (impl) versus `a * specMultiplier` with
  `specMultiplier = 3` (independent spec); applicability `3a > 500000`;
  fine range `(500000, 3a]` with strict lower bound (「を超え」) and inclusive
  upper bound (「以下」). The independent spec writes the bounds in negated
  form and uses no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (2/3/4),
  saturation (0), threshold_below (166,666 → 499,998), threshold_at
  (166,666+1 → 500,001 and 500,000), threshold_above (166,667),
  plus fine-boundary 499,999 / 500,000 / 500,001. The finite agreement grid
  is a counterexample check, not a universal theorem.
- 監査 (H/T/D/C/U): H（相当金額の三倍が50万円超なら罰金は50万円超・三倍以下）,
  T（三=3、五十万=500000、境界166666/166667・499999/500000/500001、SHA-256固定）,
  D（rfl / by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.15(4)、両数値が当該条項に存在、spec independence）,
  U（情状による裁量・犯罪成立・前項の罰金・他号他項・手続は NOT MODELLED、
    人間法的レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — a bounded computable slice only;
  the whole article is NOT claimed as verified.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
