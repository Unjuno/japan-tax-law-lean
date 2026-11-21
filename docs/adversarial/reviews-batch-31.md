### RequiredApplicationDocuments.lean — 自動車重量税法施行規則 第六条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、pinned raw JSON を worktree 外 `D:\CodexData\Temp\_rad_reextract.py` の一時 Python が直接読み、自前 walker で `tag=Article` & `attr.Num="6"` を定位・正規化（`[\s\u3000]+` 除去）。実行後に一時スクリプトは削除。
- 一次資料: `data/raw/346M50000040066_20230101_504M60000040020.law.json`（law 346M50000040066, revision 346M50000040066_20230101_504M60000040020, 自動車重量税法施行規則, 昭和四十六年大蔵省令第六十六号）。
- SHA-256 再計算: `9c5f07b0a6e4e1c9d55f9184603779c4949d5932403a06c23c03f1a8a2a90f56`（raw bytes と CRLF 正規化 blob の双方で同一、41001 bytes）。
- Article 定位: `Num="6"` を 1 件検出（正規化スコープ本文 506 文字、U+3000  count 0）。誤定位なし。
- 逐語照合: 針「前項の申出書には、同項の指定を受けようとする者に係る定款、登記事項証明書並びに最終の貸借対照表、損益計算書及び事業報告又はこれらに準ずるもの（以下この項において「定款等」という。）を添付しなければならない。」は正規化スコープ本文に verbatim 1 回存在。
- 書類列挙（本文から直接）: 五カテゴリ = 定款 / 登記事項証明書 / 貸借対照表 / 損益計算書 / 事業報告（「最終の」は会計三書類に係る修飾）。「並びに」「及び」= 連立（全部必須）。「又はこれらに準ずるもの」= 代替として認容（第六番目の書類ではない）。括弧内は「定款等」の定義名にすぎない。
- 検出器: `independent_spec_ok` True（独立構造 `SpecDocument` と独立定式 `specAllRequired` = `[...].all id` / `specSatisfies` = `||`、impl 識別子なし、普遍定理 `agree_allDocumentsAttached` が橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`review_ok` True、`spec_literals` = {}（空集合）。

判定: BY-DESIGN / CONFIRMED（原文の明示的添付義務のみをモデル化。数値を持たない構造規定のため `spec_literals` は空であり、一次資料との対応は pinned needle の逐語 1 回一致だけで anchoring される。照合は全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第六条第二項の「定款等」（五書類）を添付しなければならないという明示的必須添付要件のみ。ただし書・申出書・指定・通知は対象外。
- T（逐語性）: 自前再抽出の針が正規化スコープ本文に verbatim 1 回存在。読点・括弧・漢字を含む一字一句を保持。
- D（導出）: 「並びに/及び」→ 五フラグ全部の連立（`&&` 連鎖 / `[...].all id`）、「又はこれらに準ずるもの」→ `|| equivalentAccepted` による代替。impl と spec を普遍定理（全 Bool の場合分け + simp）が橋渡し。数値は不存在。
- C（整合）: 全て present、各单独欠落 5 通り、準ずるもののみ、空集合、単調性、完全性 ⇔ 五フラグ、impl/spec 一致を kernel-decide。書類カウント 0 / 5 境界も一致。
- U（範囲外）: ただし書の電子公衆送信装置による閲覧例外、前項の申出書・国土交通大臣の指定、第三項の通知、書類の真正性・「最終の」認定、他の条は NOT MODELLED。

注記: 本記録は機械的検証（再抽出・再計算・検出器実行）の結果であり、人間のレビューではない（LEGAL_REVIEW_PENDING）。
