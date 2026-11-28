# Adversarial review — LocalTaxArt71_28DividendTaxRate5Percent (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxArt71_28DividendTaxRate5Percent.lean — 地方税法 art.71の28

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 71の28 Paragraph 1, exact `normative_id`.
- Statutory rate: 百分の五 parsed as exact rational 5/100 = 1/20 in THIS clause;
  `spec_literals={5,100}` includes BOTH numerator and denominator, and the pair
  forms exactly the parsed rate (a 5/10 or 50/100 misreading would not pass).
- Computation: impl `base * 5 / 100`; independent spec reduces the ratio first
  (`100 / 5 = 20`) then divides `base / 20`; no implementation identifiers.
  Equivalence verified over a finite grid, not as a universal theorem.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation (0),
  threshold_below (99), threshold_at (100), threshold_above (101).
- 監査 (H/T/D/C/U): H（配当割の税率は百分の五）,
  T（5/100・1/20、境界99/100/101、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.71の28、比率5:100が当該条項に存在、spec independence）,
  U（課税標準の算定・他条項の税率・軽減措置は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
