# Adversarial review — LocalTaxArt768CommitteeSize6To12 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxArt768CommitteeSize6To12.lean — 地方税法 art.768(3)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 768 Paragraph 3, exact `normative_id`.
- Statutory literals: 六=6 (inclusive lower), 十二=12 (inclusive upper), both in THIS clause;
  `spec_literals={6,12}`, clause correspondence True.
- Computation: impl `n >= 6 && n <= 12`; independent spec uses negated comparisons
  with its own constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (5/11), threshold_at (6/12), threshold_above (7/13).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（委員定数は6人以上12人以内）,
  T（6/12、境界5/6/7・11/12/13、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.768(3)、数値当該条項に存在、spec independence）,
  U（定款の定め方・委員選任・組織運営は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
