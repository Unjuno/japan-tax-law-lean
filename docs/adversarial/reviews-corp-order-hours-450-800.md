# Adversarial review — CorpOrderArt7TeachingHours450And800 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### CorpOrderArt7TeachingHours450And800.lean — 法人税法施行令 art.7(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340M50000040012, revision
  `340M50000040012_20261001_505M60000040013`,
  `data/raw/340M50000040012_20261001_505M60000040013.law.json`.
  SHA-256 recomputed: `ae40e395af88ba819be06f9ec266b7a1c09ee87150ed9db59c3d3b86abae96d8`.
- Pinned needle located in scoped Article 7 Paragraph 1 Item 2 Subitem 2, exact `normative_id`.
- Statutory literals: 四百五十=450 (annual), 八百=800 (whole course), both in THIS clause;
  `spec_literals={450,800}`, clause correspondence True.
- Computation: impl `annual >= 450 && total >= 800`; independent spec uses negated
  comparisons with its own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (449/799), threshold_at (450/800), threshold_above (451/801).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（年間450時間以上かつ通算800時間以上）,
  T（450/800、境界449/450・799/800、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.7、数値当該条項に存在、spec independence）,
  U（学校認定・修業期間算定・他号は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
