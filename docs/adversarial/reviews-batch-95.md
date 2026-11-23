# Adversarial review — batch 95

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for MeetingQuorumOneThird.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### MeetingQuorumOneThird.lean — 審議会規則 第九条（三分の一以上の出席）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: 関税・外国為替等審議会令 (law id 412CO0000000276), revision 412CO0000000276_20260401_508CO0000000085
- Source: data/raw/412CO0000000276_20260401_508CO0000000085.law.json
- SHA-256: e7d2da2024d3909ca5b0db031f8a2bba4e9b6e4e221e9c8d94eaa74e95a9bd18 (SHA-256 照合 OK, 29504 bytes)
- Article Num: 9 (第九条). 独立再抽出で 1 structural hit、scoped 155 chars に全文 1 箇所一致を照合。
- Needle verbatim in scoped Article 9:
  「審議会は、委員及び議事に関係のある臨時委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」
- Statutory literal 3 = 三（三分の一）— confirmed in the needle;
  independent spec_literals = {3} (specDivisor), source_literals_verified True.
- 三分の一以上 = 3 * a >= t INCLUSIVE, a RATIO/QUORUM condition (not a count
  threshold): a = 出席者数 (Nat, 人), t = 委員及び臨時委員の総数 (Nat, 人), domain t > 0.
- 境界カテゴリ (>=3): zero (0), small_input (1), threshold_below (2),
  threshold_at (3), threshold_above (4) — all kernel-decided examples.
- 独立仕様: specDivisor / specQuorum defined without implementation identifiers;
  bridges are `unfold ... ; rfl` only (agreeDivisor, agreeQuorum).
- 判定 (H/T/D/C/U): H（三分の一以上の法定定足数）, T（3, INCLUSIVE >=; bytes pinned by SHA-256）, D（rfl / by decide のみ）, C（needle verbatim, boundary categories complete, spec independence confirmed）, U（議事の開会・議決手続、審議会の構成、他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
