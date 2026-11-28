# Adversarial review — LocalTaxArt350FixedAssetStandardRate1p4 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxArt350FixedAssetStandardRate1p4.lean — 地方税法 art.350

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 350 Paragraph 1, exact `normative_id`.
- Statutory rate: 百分の一・四 = 1.4% = 14/1000 = 7/500, verified as an exact
  rational against THIS clause (`spec_literals={14,1000}`); no bare-digit match
  elsewhere in the law is accepted.
- Computation: impl assembles 1.4 from `1*10+4` and `100*10`; independent spec
  carries 14/1000 and decomposes the multiplication, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_below (13/499/999), threshold_at (14/500/1000),
  threshold_above (15/1001). Finite grid, not a universal theorem.
- Rounding: Nat division (truncation) is assumed; its legal confirmation is NOT established.
- 監査 (H/T/D/C/U): H（固定資産税の標準税率は1.4%）,
  T（14/1000=7/500、境界13/14/15・499/500・999/1000/1001、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.350、rate ratio exact、spec independence）,
  U（税率決定・課税標準・評価額・端数・超過課税は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
