# Adversarial review — batch 119

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for CorporateOwnershipThird.lean and its Spec/Tests modules.

### CorporateOwnershipThird.lean — 租税特別措置法施行令 第二条（法人所有三分の一超）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 租税特別措置法施行令 第二条（法人所有三分の一超）の needle を
  含む Pinned law 407M50000008033 (大阪湾臨海地域開発整備法第十四条の地方税の
  不均一課税に伴う措置が適用される場合等を定める省令),
  revision 407M50000008033_20040401_416M60000008074.
- Source: data/raw/407M50000008033_20040401_416M60000008074.law.json
- SHA-256: 8b5ef29f2c751866b7e7f00dd7d5aea22a1c935df6173886c9e60572574ba216
  (SHA-256 照合 OK; 独立再抽出でバイト一致, BYTES 17731).
- Article Num: 2 (第二条). scoped article 1378 chars; needle verbatim 1 箇所一致を照合。
- Needle verbatim in scoped Article 2:
  「その発行済株式の総数又は出資金額若しくは拠出された金額の三分の一を超える数又は金額が法人税法（昭和二十二年法律第二十八号）別表第一第一号に掲げる法人により所有され、又は出資若しくは拠出をされている法人」
- Statutory literal: 3 = 三. parse_statutory_rate(scoped) = None (所有閾値,
  税率ではない); source_literals_verified({3}, scoped) = True; spec_literals = {3}.
- STRICT inequality confirmed: 超える = STRICTLY 3 * owned > total, NOT 以上;
  exactly 1/3 (3 * owned = total) FAILS — (1,3) と (3,9) は false,
  (2,3) (4,9) (1,2) は true。INCLUSIVE 1/3 quorum (MeetingQuorumOneThird,
  3*a >= t) は別規範で非モデル。
- 境界カテゴリ (5 >= 3): zero (0), small_input (1..4), threshold_below (2),
  threshold_at (3), threshold_above (4) — kernel-decided,
  boundary_evidence_categories(tests, {3}) で照合。
- 独立仕様: specDivisor/specExceeds に impl 識別子なし;
  independent_spec_ok(spec, impl) = True; bridges は pure `unfold ... ; rfl`
  (agreeDivisor, agreeExceeds)。
- 判定 (H/T/D/C/U): H（第二条の「三分の一を超える」, STRICT 超える）,
  T（3 = 三; bytes pinned by SHA-256）, D（rfl / by decide のみ; 単一引数バインダ）,
  C（needle verbatim, source_literals_verified True, 5 境界カテゴリ, spec 独立 + 一致）,
  U（法人税法別表第一第一号の該当性, INCLUSIVE 1/3 基準, 算定・適用場面は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
