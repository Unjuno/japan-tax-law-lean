# Adversarial review — CorpOrderArt4OwnershipOver50Percent (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### CorpOrderArt4OwnershipOver50Percent.lean — 法人税法施行令 art.4(3)(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340CO0000000097, revision
  `340CO0000000097_20261001_507CO0000000121`,
  `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`.
  SHA-256 recomputed: `92bab730d90617c1a1439ba19ba8f79041368febf3840c919103689cfcd90fe6`.
- Pinned needle located in scoped Article 4 Paragraph 3 Item 1, exact `normative_id`.
- Statutory rate: 百分の五十 = 50/100 = 1/2, verified against THIS clause;
  `spec_literals={50,100}`; no bare-digit match elsewhere is accepted.
- Computation: impl `held*100 > total*50`; independent spec `total - held < held`
  with its own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (49), threshold_at (50), threshold_above (51).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（他会社の発行済株式の50%超を保有）,
  T（50/100=1/2、境界49/50/51、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.4(3)(1)、rate ratio exact、spec independence）,
  U（自己株式の算入除外・議決権計算・他号他条は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
