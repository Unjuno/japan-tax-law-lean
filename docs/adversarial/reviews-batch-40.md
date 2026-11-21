# Adversarial review — batch 40

### PenaltyCap50k.lean — ＴＩＲ条約実施に伴う関税法等の特例に関する法律 第十八条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="18"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/346AC0000000065_20120401_424AC0000000019.law.json`（law 346AC0000000065, revision 346AC0000000065_20120401_424AC0000000019）。
- SHA-256 再計算: `82bef1179656ff64b2d1b118e065b6373071425a93d8dfbfcf2a43e195b6daf7`（生バイト 38158 バイト）→ CONFIRMED。
- Article 定位: `Num="18"` を構造走査で 1 件検出、needle はその文章ノード内に verbatim 1 回 → CONFIRMED。
- 逐語照合: needle「次の各号のいずれかに該当する者は、五万円以下の罰金に処する。」は原文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 五万 = 50000。impl の fineCap=50_000、spec の specFineCap=50_000 と一致 → CONFIRMED。
- 境界照合 (≥3): 0 → true; 49,999 → true; 50,000 → true; 50,001 → false。impl↔spec 一致も全点で確認。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（独立定数 specFineCap・独立演算子 `¬ specFineCap < amount`、impl 識別子なし。普遍定理 agreeWithin は `simp [Nat.not_lt]` の純粋書き換えで axiom-free、by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {50000}、`source_literals_verified(spec_literals, scoped)` True（五万 = 50000 を認識）。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値上限 五万円 = 50,000 円と「以下」= 包含 <= のみをモデル化。各号・ＴＩＲ条約等の参照条約・他の条文・実際の量刑は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十八条の「五万円以下の罰金」という明示的な数値上限のみ。
- T（逐語性）: 自前再抽出の needle が原文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 五万 → 50000。impl は `<=`、spec は `¬ specFineCap < amount`。橋渡しは普遍定理かつ `simp [Nat.not_lt]` のみで、追加公理を導入しない。
- C（整合）: zero / 49,999 / 50,000 / 50,001 / saturation / impl↔spec 一致を全て `by decide` または普遍定理で確認。
- U（範囲外）: 各号の違反事由・参照条約・他の条文・実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
