# Adversarial review — GasolineTaxArt27TripleFineRange (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. All statements re-derived from
committed pinned bytes; not a human legal review.

### GasolineTaxArt27TripleFineRange.lean — 揮発油税法 art.27(2)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 332AC0000000055, revision
  `332AC0000000055_20260525_506AC0000000052`,
  `data/raw/332AC0000000055_20260525_506AC0000000052.law.json`.
  SHA-256 recomputed: `e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a`.
- Pinned needle located in scoped Article Num 27, Paragraph 2
  (`LawBody[3]/MainProvision/MainProvision[5]/Article:27/Article#27/Paragraph#2/ParagraphSentence/Sentence#1`):
  「…金額の三倍が百万円を超える場合には、情状により、同項の罰金は、
  百万円を超え…三倍以下とすることができる。」
- Statutory literals: 三=3, 百万=1,000,000, both in this clause;
  `spec_literals={3,1000000}`, clause correspondence True (no rate shortcut).
- Computation: impl `3*a`, `3a > 1,000,000`, `fine > 1,000,000 && fine <= 3a`;
  independent spec `a*specMultiplier` (multiplier 3) and negated range bounds,
  no implementation identifiers reused. Fine lower bound is strict (超え),
  upper inclusive (以下).
- Boundary categories (kernel-decided): zero (0), small_input (2/3/4),
  saturation (0), threshold_below (333,333 → 999,999), threshold_at
  (333,334 → 1,000,002 and 1,000,000), threshold_above (333,334).
  The finite grid is a counterexample check, not a universal theorem.
- 監査 (H/T/D/C/U): H（相当金額の三倍が100万円超なら罰金は100万円超・三倍以下）,
  T（三=3、百万=1000000、境界333333/333334・999999/1000000/1000001、SHA-256固定）,
  D（rfl / by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.27(2)、数値当該条項に存在、spec independence）,
  U（情状裁量・犯罪成立・前項罰金・art.27(4)の五十万円特例・手続は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only;
  the whole article is NOT claimed as verified.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
