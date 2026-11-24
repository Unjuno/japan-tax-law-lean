# Adversarial review — OilGasGrantArt4Rounding (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. The statements below were
re-derived from the committed pinned bytes; they are not a human legal review.

### OilGasGrantArt4Rounding.lean — 石油ガス譲与税法 art. 4 千円未満端数控除

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340AC0000000157, revision
  `340AC0000000157_20090401_421AC0000000009`,
  `data/raw/340AC0000000157_20090401_421AC0000000009.law.json`.
  SHA-256 recomputed from the committed file:
  `3f8c479bf7015d58132f75e6bf796ea88a0f68675d444083a6f1f2f77b6af058`.
- Pinned needle re-extracted verbatim from the raw JSON and located in the
  scoped Article Num 4 (147 chars): 「…金額に千円未満の端数金額があるときは、
  その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき
  石油ガス譲与税の額とする。」
- Statutory literal: 千円 = 1,000. The literal appears in THIS clause, not merely
  somewhere in the full law; `千円` occurs once in the whole pinned law.
- Rounding direction: 控除 = subtraction of the fraction below ¥1,000, i.e.
  truncation, NOT round-to-nearest (四捨五入). The implementation uses
  `computed / 1000 * 1000`; the independent spec uses
  `computed - computed % 1000` with its own `specRoundingUnit`, so no
  implementation identifier is reused.
- Boundary categories (kernel-decided): zero (0, 1), saturation (0),
  threshold_below (999), threshold_at (1000), threshold_above (1001). Nine-point
  finite agreement grid; not asserted as a universal theorem.
- 監査 (H/T/D/C/U): H（前二条で計算した額から千円未満の端数を控除する）,
  T（千円=1000、境界999/1000/1001、SHA-256固定、needle scoped）,
  D（rfl / by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.4、literal in clause、spec independence）,
  U（前条第一項の譲与時期・前二条の額算定・指定市認定・経過措置は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — a bounded computable slice only;
  the whole article is NOT claimed as verified.

This review is mechanical and does NOT satisfy the human legal-review axis,
which remains `LEGAL_REVIEW_PENDING`.
