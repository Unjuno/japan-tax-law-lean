# Adversarial review — IncomeTaxOrderArt2_3Amount3500000 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### IncomeTaxOrderArt2_3Amount3500000.lean — 所得税法施行令 art.2の3

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 332CO0000000043, revision
  `332CO0000000043_20261101_507CO0000000127`,
  `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`.
  SHA-256 recomputed: `d0ad21a838fd3d2a3b107a001b91a31ee00c267dc776bcd608b0ef018cf5494d`.
- Pinned needle located in scoped Article 2の3 Paragraph 1, exact `normative_id`.
- Statutory literals: 三百万=3,000,000 (before), 三百五十万=3,500,000 (after),
  both in THIS clause; `spec_literals={3000000,3500000}`, clause correspondence True.
- Computation: impl `base + (3500000 - 3000000)`; independent spec
  `base + 3500000 - 3000000`, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_at (3,000,000 / 3,500,000). Finite grid,
  not a universal theorem.
- 監査 (H/T/D/C/U): H（法3条の4適用時は300万円を350万円に読み替える）,
  T（3000000/3500000、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.2の3、数値当該条項に存在、spec independence）,
  U（法3条の4の適用判定・施行令40条/41条の他規定は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
