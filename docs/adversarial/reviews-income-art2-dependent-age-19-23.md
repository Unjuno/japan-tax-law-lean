# Adversarial review — IncomeTaxArt2DependentAge19To23 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### IncomeTaxArt2DependentAge19To23.lean — 所得税法 art.2(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340AC0000000033, revision
  `340AC0000000033_20261001_507AC0000000070`,
  `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
  SHA-256 recomputed: `94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b`.
- Pinned needle located in scoped Article 2 Paragraph 1 Item 34-3 Column 2:
  「控除対象扶養親族のうち、年齢十九歳以上二十三歳未満の者をいう。」
- Statutory literals: 十九=19 (inclusive lower), 二十三=23 (exclusive upper);
  both occur in THIS clause; `spec_literals={19,23}`, clause correspondence True.
- Computation: impl `age >= 19 && age < 23`; independent spec uses negated
  comparisons `!(age < specMinAge) && !(specMaxAge <= age)` with its own
  constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (18 vs 19, 22 vs 23), threshold_at (19, 23),
  threshold_above (20 vs 19, 24 vs 23). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（扶養親族の年齢は19歳以上23歳未満）,
  T（19/23、境界18/19/20・22/23/24、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.2、数値当該条項に存在、spec independence）,
  U（扶養の事実認定・所得金額・控除額計算は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
