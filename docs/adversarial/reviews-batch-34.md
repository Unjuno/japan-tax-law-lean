### ResidentialAreaRatioInterval.lean — 地価税法施行令 第九条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp\_adv34_extract.py` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="9"` を定位・正規化（`[\s\u3000]+` 除去）。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/403CO0000000174_20250722_507CO0000000249.law.json`（law 403CO0000000174, revision 403CO0000000174_20250722_507CO0000000249, 地価税法施行令）。
- SHA-256 再計算: `580d177620a136513316a476f404e643b0b4522c6e1bf06ce54ae4e9dd6580ee`（raw bytes 149096, CRLF 正規化後も同一）。
- Article 定位: `Num="9"` を 1 件検出（正規化スコープ本文 1131 文字）。誤定位なし。
- 逐語照合: 針「居住面積割合が百分の二十五を超え百分の五十以下である場合」は正規化スコープ本文に verbatim 1 回存在。読点・漢字を一字一句保持。
- 数値再計算（自前 kanji パーサ）: 百分の二十五→25/100=25%, 百分の五十→50/100=50%, 超え=strict `<`, 以下=inclusive `<=`。境界 ≥3: (26,100)→true (26%), (25,100)→false (25% は超えでない), (50,100)→true (以下), (51,100)→false, (26,0)→false（零総面積）。impl の cross-multiplication 期待値と全一致、矛盾 0。
- 検出器: `independent_spec_ok` True（独立定数 specLower/specUpper/specScale・独立演算子 `>`、impl 識別子なし。普遍定理 `agree_ratioInInterval` が omega で橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {25, 50, 100}、`source_literals_verified(spec_literals, scoped)` True、`review_ok` True。

判定: BY-DESIGN / CONFIRMED（原文の明示的な百分率区間のみをモデル化。周辺の宅地利用状況・地積認定・特例適用の法的判断、丸め／除算は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第九条の「居住面積割合が百分の二十五を超え百分の五十以下である場合」の数値区間のみ。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 百分の二十五→25, 百分の五十→50, 百分→100, 超え→strict `<`, 以下→inclusive `<=`。比は residential*100/total、整数 cross-multiplication で除算・丸めなし。独立 spec は `>` と被演算子順序を入れ、普遍 omega 定理でカーネル橋渡し。
- C（整合）: zero total, 25/26/50/51%, 小さい正の入力, Nat saturation, impl↔spec 一致を全て `by decide`。境界 25% 除外・50% 採用を確認。
- U（範囲外）: 宅地の利用状況・地積認定・特例適用判断、他の条項・附則、実数丸め、負の面積（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING）。
