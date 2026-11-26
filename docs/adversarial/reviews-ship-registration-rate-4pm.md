# Adversarial review — ShipRegistrationRateReduction4PerMille (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### ShipRegistrationRateReduction4PerMille.lean — 登録免許税法 art.17(2)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 342AC0000000035, revision
  `342AC0000000035_20261101_508AC0000000021`,
  `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`.
  SHA-256 recomputed: `95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15`.
- Pinned needle located in scoped Article 17 Paragraph 2:
  「…登録免許税の税率は、同号（二）の税率欄に掲げる割合から千分の四を控除した割合とする。」
- Statutory literal: 四=4 (per mille) in THIS clause; `spec_literals={4}`,
  clause correspondence True.
- Computation: impl saturating subtraction `base - 4`; independent spec uses an
  explicit `if base < 4 then 0 else base - 4` with its own constant, no
  implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_below (3), threshold_at (4), threshold_above (5).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（船舶の本登記は別表の割合から千分の四を控除）,
  T（四=4、境界3/4/5、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.17(2)、数値当該条項に存在、spec independence）,
  U（別表の税率・仮登記の認定・課税価格・税額計算は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
