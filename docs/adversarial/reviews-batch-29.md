### ThousandYenTruncation.lean — 石油ガス譲与税法施行規則 第五条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_tytr_reextract.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="5"` を定位・正規化。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/341M50000008002_20191128_501M60000008059.law.json`（law 341M50000008002, revision 341M50000008002_20191128_501M60000008059）。
- SHA-256 再計算: `4a676a0093742423265ad491a7d498c1d7256efd26ba7cf91eb3d165fa48bc96` — INVENTORY の `source_sha256` と一致（大文字小文字のみ差）。
- Article 定位: `Num="5"` の Article を 1 件検出（正規化スコープ本文 871 文字）。誤定位なし。
- 逐語照合: 針「第一項の都道府県又は指定市に譲与すべき額に加算し、又は当該譲与すべき額から減額すべき錯誤に係る額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤に係る額とする。」は正規化スコープ本文に verbatim 1 回存在（「千円」「控除」も各 1 回）。
- 数値再計算: 千円 = 1000 円（unit 円, 千 = 10^3）。控除 = 切り捨て（DOWN）、四捨五入ではない。千円未満 = amount % 1000 < 1000。
- ≥3 境界再計算: 999→0, 1000→1000, 1500→1000, 12345→12000（impl / spec 双方で一致）。
- 検出器: `independent_spec_ok` True（独立定数 `specRoundingUnit`・独立演算子 `÷` 再構成）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {1000}、`source_literals_verified(spec_literals(spec), scoped_article_text)` True（千円 = 1000 は原文「千円」として verbatim 存在）。

判定: BY-DESIGN / CONFIRMED（原文の明示的圆数規則のみをモデル化。改変・拡張なし。照合は全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第五条の「千円未満の端数金額を控除した金額をもつて、当該錯誤に係る額とする」の端数処理のみ。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・漢字を含む一字一句を保持。
- D（導出）: 千円 → 1000 円を原文から直接採用。控除 → 切捨て（DOWN）を `amount - amount % 1000` と定式化。impl（剰余減算）と spec（除算再構成）を普遍定理 `agreeTruncation`（omega）が橋渡し。
- C（整合）: 0/1/999/1000/1500/12345/100000 で impl=spec、全境界一致。spec 定数 1000 は原文「千円」として verbatim 存在し `source_literals_verified` は True。
- U（範囲外）: 第一条の加算・減額手続、道路延長・面積の算式、小数点以下三位未満の四捨五入、附則、他の条、司法判断は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
