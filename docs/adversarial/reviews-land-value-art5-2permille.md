# Adversarial review — LandValueTaxArt5Heisei4Rate2PerMille (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LandValueTaxArt5Heisei4Rate2PerMille.lean — 地価税法 附則 art.5

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 403AC0000000069, revision
  `403AC0000000069_20250601_504AC0000000068`,
  `data/raw/403AC0000000069_20250601_504AC0000000068.law.json`.
  SHA-256 recomputed: `0fe4bb9c6d07ff6e648db1d5bdb49af134af1b1f7563ea641ea8f87d4f72cbe2`.
- Pinned needle located in scoped Supplementary Provision Article 5, exact `normative_id`.
- Statutory literals: 三=3 (original), 二=2 (substituted), 千=1000 (denominator);
  `spec_literals={2,1000}`, clause correspondence True. This is a per-mille reading,
  not a 百分の rate, so no rate-ratio shortcut is claimed.
- Computation: impl `base*2/1000`; independent spec decomposes as
  `base/1000*2 + (base%1000)*2/1000` with its own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation (0),
  threshold_below (499/999), threshold_at (500/1000), threshold_above (1001).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（平成4年の地価税は千分の三を千分の二に読み替える）,
  T（3/2/1000、境界499/500/999/1000/1001、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.5、数値当該条項に存在、spec independence）,
  U（課税時期判定・適用年・他附則条・課税価格算定・端数処理の法的確定は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
