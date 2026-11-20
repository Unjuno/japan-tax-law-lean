# Adversarial Review — Batch 19（独立機械クロスチェック）

レビュー日: 2026-11-21 / 独立レビューエージェント。**機械的独立照合であり人間の法解釈レビューではない**。doc-comment と `transcription_audit.py` は不信; 使い捨て自前 Python（`D:\CodexData\Temp\opencode\_adv19_extract.py`, 実行後削除）で pinned 生 JSON を直接読み, SHA-256 再計算, Article を `attr.Num` で定位, 原文 leaf を抽出。本環境に lake/lean なし, カーネル再実行は未実施（`by decide` 期待値と独立計算を照合）。

### UsForcesDeemedForeignGoods.lean — 関税法等の臨時特例に関する法律（法327AC0000000112） 第十二条第六項

- **pinned ids（JSON 側から独立再確認）**: law_revision_id `327AC0000000112_20190317_429AC0000000013`, law_title 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う関税法等の臨時特例に関する法律, amendment_enforcement_date `2019-03-17`, current_revision_status `CurrentEnforced`（`revision_info` より抽出; doc-comment は信用せず）。
- **H（反証可能な仮説）**: 第十二条第六項第一文「第一項の規定の適用を受ける物品は、関税法の適用については、同法の外国貨物とみなす。」は `deemedForeignGoods = receivesParagraph1 && (ctx == customsLaw)` を意味し, 「関税法の適用については」がみなしを関税法に限定する（他法では発火しない）。原文が別文言/別条, 又は数量閾値を含めば反証される。
- **T（検出/照合）**: 生 JSON 実測 `107,649` bytes → SHA-256 独立再計算 `ca251c418b17aef8e9205d8f53417c14214ee9840579bf69e75828e4d9cc1a6d`（pinned と一致）。`tag=Article, attr.Num="12"` を **1 件**検出 `/law_full_text/children/1/children/1/children/11` → **LOCATED**; 同 Article の `Paragraph attr.Num="6"`（`.../children/7`）直下 `Sentence Num="1"` の原文 leaf を取得。
- **独立抽出（原文リテラル）**: 「第一項の規定の適用を受ける物品は、関税法の適用については、同法の外国貨物とみなす。」— Article12 全文で各フレーズ（`第一項の規定の適用を受ける物品` / `関税法の適用については` / `同法の外国貨物とみなす`）は **各1回**（引用を信用せず原文側で確認）。同項第二文（無許可譲受物品・関税法第六十七条）は存在するが未モデル化。
- **リテラル/数式比較**:
  | 原文リテラル | 独立計算 | Lean | 照合 |
  |---|---|---|---|
  | 「第一項の規定の適用を受ける物品」 | Bool `receivesParagraph1` | `deemedForeignGoods` 第1引数 | ✅ |
  | 「関税法の適用については」 | `ctx == customsLaw` | `LegalContext.customsLaw` | ✅ |
  | 「同法の外国貨物とみなす」 | 結果 = true（みなし発火） | `deemedForeignGoods = true` | ✅ |
  | 他法への波及なし（「関税法の適用については」） | `ctx = otherLaw` → false | `no_deeming_under_other_law` | ✅ BY-DESIGN |
  | 数量閾値・第二文・第一項の実体・政令 | 数式なし・非モデル化 | スライス外 | ✅ BY-DESIGN |
- **反例再計算（≥3, 自前 Python）**: ① `deemed(false,otherLaw)=false`（零入力）② `deemed(true,customsLaw)=true`（正入力）③ `deemed(true,otherLaw)=false`（スコープ境界）④ `deemed(false,customsLaw)=false`; 恒等 `deemed(f,customsLaw)=f` と他法での false 飽和も全入力で成立。`-Tests.lean` の `by decide` 期待値と全面一致, 矛盾 0。
- **D（判定）**: **BY-DESIGN / CONFIRMED 0**。**LOCATED, UNRESOLVED なし**。scope: 関税法スコープ付きみなし判定のみ; 第一項実体・外国貨物定義・第二文・政令は非モデル化。
- **C（解釈の余地）**: 「みなす」は法律上の擬制であり実質分類ではない; 「関税法の適用については」を他法まで及ぼす読みは原文に反し除外; 第一項の該当性は caller-established。
- **U（未解決）**: 第一項の実体的要件, 関税法上の外国貨物の定義, 第二文の輸入許可みなし, 政令細目は要専門家。
- **限定**: **機械的独立クロスチェックであり人間の法律レビューではない**。カーネル再実行は未実施。一時 Python は削除済み。
