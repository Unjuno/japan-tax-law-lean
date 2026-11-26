# Adversarial review — SpecialTaxOrderArt124Rate25To8 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### SpecialTaxOrderArt124Rate25To8.lean — 租税特別措置法施行令 附則 art.124(6)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 332AC0000000026, revision
  `332AC0000000026_20261101_507AC0000000013`,
  `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
  SHA-256 recomputed: `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee`.
- Pinned needle located in scoped Supplementary Provision Article 124 Paragraph 6:
  「この場合において、同項中「千分の二十五」とあるのは、「千分の八」とする。」
- Statutory literals: 二十五=25 (before), 八=8 (after), 千=1000 (denominator),
  all in THIS clause; `spec_literals={8,25,1000}`, clause correspondence True.
  This is a per-mille reading substitution, not a 百分の rate; no rate-ratio
  shortcut is claimed.
- Computation: impl `appliedAmount = base * 8 / 1000`; independent spec decomposes
  as `base/1000*8 + (base%1000)*8/1000` with its own numerator/denominator
  constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_below (24/999), threshold_at (25/1000),
  threshold_above (26/1001). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（同項の千分の二十五を千分の八に読み替える）,
  T（25/8/1000、境界24/25/26・999/1000/1001、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.124(6)、数値当該条項に存在、spec independence）,
  U（「この場合」の要件・他号の読替え・課税標準・税額計算は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
