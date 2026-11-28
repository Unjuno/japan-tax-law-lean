# Adversarial review — LocalGasolineArt7PaymentAllocation287 (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalGasolineArt7PaymentAllocation287.lean — 地方揮発油税法 art.7(2)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 330AC0000000104, revision
  `330AC0000000104_20260401_508AC0000000012`,
  `data/raw/330AC0000000104_20260401_508AC0000000012.law.json`.
  SHA-256 recomputed: `c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a`.
- Pinned needle located in scoped Article 7 Paragraph 2, with exact `normative_id`.
- Statutory literals: 二百八十七=287 (denominator), 四十四=44 (local), 二百四十三=243
  (national); all in THIS clause; `spec_literals={44,243,287}`, clause correspondence True.
  The two numerators sum to the denominator (44+243=287).
- Computation: impl `amount*44/287` and `amount*243/287`; independent spec uses its own
  numerator/denominator constants for both shares, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_below (286), threshold_at (287), threshold_above (288).
  Finite grid, not a universal theorem.
- Rounding: Nat division (truncation) is assumed; its legal confirmation is NOT established.
- 監査 (H/T/D/C/U): H（納付額を地方44/287・国243/287に配分）,
  T（44/243/287、境界286/287/288、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.7(2)、数値当該条項に存在、spec independence）,
  U（免除要件・徴収手続・端数処理の法的確定は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
