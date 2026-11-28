# Adversarial review — SpecialTaxOrderArt80CapitalFeeFloor30k (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### SpecialTaxOrderArt80CapitalFeeFloor30k.lean — 租税特別措置法施行令 art.80(3) 第2号（合同会社）

Scope: item 2 only (¥30,000 floor). Item 1 (株式会社, ¥75,000 floor) has a separate model
and separate attestation; the two must not be cross-applied.

- 独立再抽出 (一次資料): law id 332AC0000000026, revision
  `332AC0000000026_20261101_507AC0000000013`,
  `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
  SHA-256 recomputed: `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee`.
- Pinned needle located in scoped Article 80 Paragraph 3 **Item 2**:
  「当該合同会社の資本金の額に千分の三・五を乗じて計算した金額（…三万円に満たない場合には、
  申請件数一件につき三万円）」. The evidence pin carries the exact item-2 `normative_id`.
- Statutory literals: 三=3, 五=5 (三・五), 千=1000, 三万=30000, all in THIS clause;
  `spec_literals={3,5,10,1000,30000}`, clause correspondence True.
- Computation: impl `(3*10+5)/(1000*10)` with `if < 30000`; independent spec uses its own
  constants and `max`, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation (floor),
  threshold_below (999/8,571,428), threshold_at (1000/30,000),
  threshold_above (1001/8,571,429). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（合同会社は資本金×3.5/1000、3万円未満なら一件3万円）,
  T（3・5/1000/30000、境界8,571,428/8,571,429、SHA-256固定、item-2 pin）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped item 2、数値当該項に存在、spec independence）,
  U（会社認定・申請件数乗算・他号・端数処理の法的確定は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — one computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
