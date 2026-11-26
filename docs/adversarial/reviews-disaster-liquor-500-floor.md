# Adversarial review — DisasterLiquorDeduction500YenFloor (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### DisasterLiquorDeduction500YenFloor.lean — 災害被害者租税減免法 art.7(3)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 322AC0000000175, revision
  `322AC0000000175_20220101_503AC0000000011`,
  `data/raw/322AC0000000175_20220101_503AC0000000011.law.json`.
  SHA-256 recomputed: `c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef`.
- Pinned needle located in scoped Article Num 7 Paragraph 3
  (`.../Article:7/Article#7/Paragraph#3/ParagraphSentence/Sentence#1`):
  「…金額…が五百円未満である場合における当該金額については、同項の控除を行わない。」
- Statutory literal: 五百 = 500 in THIS clause (`五百円` occurs once in the
  pinned law); `spec_literals={500}`, clause correspondence True.
- Computation: impl `!(amount < 500)` and `if amount < 500 then 0 else amount`;
  independent spec uses `specMinYen <= amount` with a different comparison and
  its own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation
  (effective deduction 0), threshold_below (499), threshold_at (500),
  threshold_above (501). Finite grid check, not a universal theorem.
- 監査 (H/T/D/C/U): H（被災酒類の控除額が500円未満なら控除しない）,
  T（五百=500、境界0/1/499/500/501、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.7(3)、数値当該条項に存在、spec independence）,
  U（被災酒類の所持・税額計算・税目合算・第一項の控除自体は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
