# Adversarial review — LocalTaxArt20_4_2RoundDown1000 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxArt20_4_2RoundDown1000.lean — 地方税法 art.20の4の2

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 20の4の2 Paragraph 1, exact `normative_id`.
- Statutory literal: 千円=1000 in THIS clause; `spec_literals={1000}`, clause correspondence True.
- Computation: impl `amount - (amount % 1000)`; independent spec `(amount / 1000) * 1000`,
  no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation (0),
  threshold_below (999), threshold_at (1000), threshold_above (1001/1999).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（千円未満の端数または全額を切り捨てる）,
  T（1000、境界999/1000/1999/2000、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.20の4の2、数値当該条項に存在、spec independence）,
  U（課税標準額の算定・他端数処理・特例は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
