### SCFVPenaltyCeiling.lean — 所得税法等の臨時特例に関する法律 第十一条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_scfv_reextract.py` の一時 Python が直接読み、自前 walker で Article を定位・正規化。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/327AC0000000111_20250601_504AC0000000068.law.json`（law 327AC0000000111, revision 327AC0000000111_20250601_504AC0000000068）。
- SHA-256 再計算: `04223c3926ac2a26dd0ff9120a712b6e3aa4af0285455db1be9163bd7074c1b2` — INVENTORY の `source_sha256` と一致。
- Article 定位: 自前 walker が `law_full_text` を走査し `tag=Article` かつ `attr.Num="11"` を 2 件検出（本則第十一条 879 文字＝針 1 回、附則第十一条 305 文字＝針 0 回）。針を含む本則 paragraph 3 を選択。誤定位なし。
- 逐語照合: 針「第一項の規定に違反した者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」は正規化スコープ本文に verbatim 1 回存在。
- 数値再計算: 一年 = 1 年（原文の直接値, unit 年, 月換算なし）; 五十万 = 50×10^4 = 500,000 円（unit 円）。「以下」= inclusive (<=)。二軸は次元的に独立（年 vs 円、混在禁止、§3）。
- ≥3 境界再計算: 年 0/1 → true, 2 → false; 円 0/499,999/500,000 → true, 500,001 → false（impl と spec の双方で一致）。
- 検出器: `independent_spec_ok` True（独立定数・独立演算子 `¬ >`）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {500000}（generator が構造リテラル 0/1 を除外するため一年の 1 は非計上）、`source_literals_verified(spec_literals, scoped_article_text)` True（{500000} は「五十万」として原文に verbatim 存在）。一年の 1 も「一年」として verbatim 存在し、二つの spec 定数はいずれも直接照合可能。

判定: BY-DESIGN / CONFIRMED（原文の二つの明示的数値上限のみをモデル化。改変・拡張なし。照合は全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十一条第三項「一年以下の拘禁刑又は五十万円以下の罰金に処する。」の数値上限のみ。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・漢字を含む一字一句を保持。
- D（導出）: 一年 → 1 年、五十万 → 500,000 円を原文から直接採用（換算なし）。「以下」inclusive。impl `<=` と spec `¬ >` を普遍定理 `agree_*`（omega）が橋渡し。
- C（整合）: 1/2 年・499,999/500,000/500,001 円・zero・単調性で impl=spec、全境界一致。spec 定数 1 と 500000 はともに原文に verbatim 存在し、`source_literals_verified(spec_literals, scoped)` は True。
- U（範囲外）: 「又は」による代替関係、第一項の違反要件、第二項の徴収、第四項の法人重課、附則第十一条、司法判断としての科刑は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
