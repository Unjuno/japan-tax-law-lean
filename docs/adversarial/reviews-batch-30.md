### TonTaxPunishment.lean — とん税法 第十二条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_tt_reextract.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="12"` を定位・正規化。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/332AC0000000037_20250601_504AC0000000068.law.json`（law 332AC0000000037, revision 332AC0000000037_20250601_504AC0000000068）。INVENTORY の source_sha256 と一致。
- SHA-256 再計算: `fe033954f29722501d8307e078084959f1e49a7868e2205be4e9faf843dc92a3`（raw bytes と CRLF 正規化 blob の双方で同一）。
- Article 定位: `Num="12"` を 1 件検出（正規化スコープ本文 171 文字）。誤定位なし。
- 逐語照合: 針「偽りその他不正の行為により、とん税を免れ、又は納付すべきとん税を納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する。」は正規化スコープ本文に verbatim 1 回存在（「三年」「五十万」「併科」も各 1 回）。
- 数値再計算: 三年 = 3 年、五十万 = 500,000 円。以下 = inclusive (<=)。
- ≥3 境界再計算: 3 年 within / 4 年 over、500,000 円 within / 500,001 円 over、併科 both flags true は (3, 500000) で valid、(4, 500001) で invalid。impl/spec 双方で一致。
- 検出器: `independent_spec_ok` True（独立定数 specImprisonmentCeiling=3・specFineCeiling=500000、独立演算子 `¬ n > c` / `∨`、impl 識別子なし）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {3, 500000}、`source_literals_verified(spec_literals(spec), scoped_article_text)` True（三年 = 3、五十万 = 500000 は原文に verbatim 存在）。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値上限と併科選択のみをモデル化。改変・拡張なし。照合は全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第十二条の「三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する」の数値上限と併科選択のみ。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・漢字を含む一字一句を保持。
- D（導出）: 三年 → 3（年）、五十万 → 500,000（円）を原文から直接採用。impl（<=）と spec（¬ >）を普遍定理 specWithinImprisonment_prop / specWithinFine_prop / agreeSentence（omega）が橋渡し。併科は上限とは別規則として明示。
- C（整合）: 0/1/2/3/4 年、499999/500000/500001 円、4 送信モードで impl=spec、全境界一致。年と円の次元は混合しない。
- U（範囲外）: 不正行為の認定、免れ/納付しなかつた事実認定、未遂、司法判断、手続、他の条は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
