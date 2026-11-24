### PostOfficeExceptionDate.lean — 沖縄 special 第十条（指定郵便局は八月三十一日）

- 独立再抽出: impl / spec / tests の doc-comment と transcription pin を一切信用せず、使い捨て Python が `data/raw/347CO0000000150_20251231_507CO0000000426.law.json` を直接読み、自前 walker で全ツリー走査・SHA 再計算・漢字パースを実施。一時スクリプトはレビュー後に削除。
- 一次資料: law 347CO0000000150, revision 347CO0000000150_20251231_507CO0000000426, Article Num 10（第十条, MAIN provision）。
- SHA-256（CRLF→LF 正規化）: 実測 `6d98ec0adf89b24d3e80899607cd37cef883495efd5175db8a60841105486cff` = impl ヘッダ pin 一致。CONFIRMED。
- needle 逐語: 「ただし、郵政大臣が指定する郵便局にあつては、同年八月三十一日とする。」— scoped Article 10 に verbatim で存在（照合一致）。CONFIRMED。
- リテラル: 八 = 8（exceptionMonth / specMonth）, 三十一 = 31（exceptionDay / specDay）。両数詞が needle 内に存在し、`parse_statutory_rate` = None（率ではない）。`source_literals_verified({8,31}, scoped)` = True。CONFIRMED。

H/T/D/C/U（独立レビュー記録）:

- H（反証可能仮説）: 特例日は (8, 31) の EXACT date であり、片方だけ一致する月日はことごとく false になる。
- T（再生・実出力）: Python で `isExceptionDate` / `specIsDate` を再実装し (8,31)=true, (8,30)=false, (9,31)=false, (7,31)=false, (1,1)=false, (0,0)=false を確認。`boundary_evidence_categories(tests,{8,31})` = {zero, small_input, threshold_below, threshold_at, threshold_above}（5 カテゴリ）。`independent_spec_ok` = True、`spec_literals` = {8,31}。
- D（判定）: **PASS / CONFIRMED**。SHA・needle・Article 10・リテラル 8/31・5 境界カテゴリすべて一致。BY-DESIGN: 郵便局の指定・一般ルールの日付・年算術・暦妥当性チェックは NOT MODELLED。
- C（競合説明）: 「(8,31) を含む月または日のみで一致とみなす」誤読を検査。(9,31)/(7,31)/(8,30)/(8,32) が false であることをカーネル決定例で棄却。近傍だけでの一致はない。
- U（不確実性）: 本環境に Lean バイナリがなく実カーネル実行は未実施（静的読了と Python 模擬のみ）。法的正当性は一切主張しない。

### 判定（verdict）

**NO CONCRETE DEFECT FOUND。** 本レビューは機械的・経験的検証の記録であり、人間の法的レビューに代わるものではない（LEGAL_REVIEW_PENDING / NO LEGAL CORRECTNESS CLAIM）。
