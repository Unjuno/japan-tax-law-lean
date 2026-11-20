# 統合ステータス台帳 — 進捗・完了率・限界（2026-11-15 時点）

本書は、日本の税法形式検証（Unjuno/japan-tax-law-lean）の**実測に基づく進捗**を、Phase ごとに機械検証可能な形で記録します。数値は本書作成時に `build/audit_sweep.json`・`data/INVENTORY.json`・`python -m unittest` の実行結果から転記したもので、第三者が同一コミットから再現できます（再現手順は末尾）。

> **本書の数値は自動計測による下限です。** 「不明」を「成功」に数えません。`candidate` は**未確定の監査上の候補**であり、欠陥ではありません。`verified-anomaly`（独立の法的レビューを通過したと判定できる異常）は現時点で **0 件**のままです。

## 1. 対象母集団（Phase A — 対象法令台帳）

| 指標 | 実測値（2026-11-15） |
|---|---|
| e-Gov 全現行法令一覧 | 9,001 件のうち `税` を含む **327 件**（法律 74・政令 113・省令/府令 140） |
| 適用版確定 | **325 / 327**（324 CurrentEnforced + 1 historical_fallback; 内 1 は `audit_ready=False`） |
| 完全未施行（unresolved） | 2 件（`508CO0000000106` 防衛特別所得税政令・`508M60000040027` 防衛特別所得税省令）— **検証対象から除外、成功に計上しない** |
| 原文・改正履歴のハッシュピン留め | 325 件全件 `data/raw/` に SHA-256 固定、`validate_inventory.py` OK |
| `INVENTORY.json` 検証 | OK — 327 records / 325 resolved / 2 unresolved |

**未実装の母集団（記録済・対象外扱い）**

- 地方税条例（市町村・特別区・都道府県ごとの独立法源、約 1,788 団体）: 台帳上 `unsupported`。国税の現行法令一覧に含まれず、別途の取得戦略が必要。
- 租税条約・通達・裁判例・告示を含む解釈レイヤー: 法令本文と区別し未対応（`unsupported`）。
- 関税法・関税定率法（関税系）は台帳（税キーワード抽出 327 件）に含まれることを確認済みだが、Lean 意味モデルは未着手。

## 2. Phase 別の完了状況

| 層/Phase | 状態 | 実測 |
|---|---|---|
| **PHASE A — 全法令インベントリ** | **完了（325/327 ピン留め; 2 件は未施行のため検証不能）** | 取得 325/325 OK、ハッシュ検証 OK |
| **PHASE B — 全体系の構造監査** | **完了（機械処理のみ、未確定）** | 対象 325 件 / パース失敗 0 / 監査失敗 0 |
| **PHASE C — 共通形式意味論** | **完了**（`JapanTaxLaw/TaxFinance.lean`） | Money、TaxRate(floor/ceil 証明)、Period、Priority（law>order>notice、全順序・推移律・非反射律）; 21 件の dec テスト |
| **PHASE D — 税目別形式化（actor scope のみ）** | **進行中**（PR #1 以降 stacked で PR #5–#18・#20 ほか、機械検証は全て `propext` のみ） | 意味モデルは定義層・actor scope に限定 |
| **PHASE E — 法令横断検証** | **着手（シード＋意味横断モジュール ×3＋普遍支配定理1件）** `scripts/law_audit/phase_e/cross_law.py` + `JapanTaxLaw/PhaseECorpRates.lean` + `JapanTaxLaw/SpecialGiftRate.lean` + `JapanTaxLaw/StampDutySpecial91.lean` + `JapanTaxLaw/SpecialGiftRateDomination.lean`（租税特別措置法 art. 70の2の5 特別表 ≤ 相続税法 art. 21-7 一般表の**普遍支配定理** `specialGiftPortionTax_le_giftPortionTax`: pure-Nat 展開 + 9区間 `omega`、`grind` 不使用） | 実 `JapanTaxLaw/*.lean` のピン vs 台帳整合（**複数法令ピンのブロック単位独立照合対応・テスト14**）に加え、法人税法 art. 66 ↔ 租税特別措置法 art. 67の2(1)・art. 68(1)(2) の**税率整合性**を機械検査（19%<22%<23.2%・¥10億以下で art. 66(3) と同値・超過分の分裂加法性・月数換算 cap・単調非減少）・贈与税率表の**普遍支配**（pure-Nat 分割・exact 証明・公理なし）。他の法令間の意味横断検証は未完了 |
| **PHASE F — 改正影響検証** | **着手（シード・計測のみ・意味 diff 未実装）** | `scripts/law_audit/phase_f/revision_impact.py` 実装済み・8 テスト（PR #20）。325 件の現行改正版 pin を機械検査（`{law_id}_{yyyymmdd}_{amendment_law_id}` 形状・埋め込み改正 id と台帳の `amendment_law_id` の一致（原法 `_000000000000000` と null の対応）・施行日 ≤ snapshot_date）。**結果: 0 problems**。189 相異なる改正法を計測・**原始立法 48 件**検出。本台帳（税キーワード 327 件）に内在するのは **3 件**のみ、残り 186 件は台帳外として記録のみ・判定せず。**新旧 diff の意味伝播機構は未実装** |
| **PHASE G — 統合監査（再現可能）** | **未完了**（`lake build`+`unittest`+`validate_inventory`+clean builds ×2 は CI にある） | 第三者再現手順は `CONTRIBUTING.md` と CI 経由; 統合レポート生成はこれから |

## 3. Phase B の実測値（`build/audit_sweep.json`、2026-11-15）

| 指標 | 実測 |
|---|---|
| 走査対象 | 325 法令、0 parse failure、0 audit failure |
| 条文数 | **42,584**（附則前文を synthetic article として包含・本文33,652＋前文8,932／項 86,403／号 61,672） |
| 参照抽出数 | **476,500**（内部解決 100,944 / 外部未解決 157,983 / 未対応構文 250,043） |
| 監査結果 | **verified-anomaly 0 件** / **candidate 3,438 件（すべて未確定）** |

候補内訳（by rule；すべて未確定・独立レビュー未実施）:

| ルール | 件数 |
|---|---|
| PAREN.UNBALANCED（かっこ不整合） | 1,492 |
| REF.ITEM.MISSING（号参照欠落） | 829 |
| REF.ARTICLE.MISSING（条参照欠落） | 587 |
| REF.PARA.MISSING（項参照欠落） | 339 |
| REF.SUPP.MISSING（附則参照欠落） | 99 |
| REF.ARTICLE.DELETED（削除条文参照） | 39 |
| STRUCT.GAP.ARTICLE（条番号の連番ギャップ） | 5 |
| REF.RELATIVE.MISSING（相対参照の不一致） | 3 |
| TOC.BODY.MISSING（目次と本文の不整合） | 1 |

なお、2026-11-16 以降、Phase B スイープは各法令のファミリー法令（法 ↔ 施行令 ↔ 施行規則）を
相互に（325 法令中 161 法令で 284 本の）クロスロー勘定で解決してから検査する（`scripts/law_audit/inventory/sweep.py`）。
これにより相互参照の検証可能数が増えた（内部解決可能 63,214 → 100,565 件に再計測）。
外部未解決 169,032 → 151,999 件に減少した。family 法令が台帳に無い場合の相互参照は、
未検証（external）として誠実に計上される（虚偽の `REF.SUPP.MISSING` 候補を出さないよう修正済み）。

**2026-11-16: 監査器の検出漏れ 3 件を修正（外部レビュー指摘に基づく）**

1. **細目（Subitem）のパース漏れ**（`model.py`）: `Subitem1/2/3/4` は Paragraph の直接の子ではなく Item の子として入れ子になっているため、実質全ての細目が `ParagraphRec.items` から脱落していた。再帰的ディセント＋正しいレベル付与（Item=0, Subitem1=1, … Subitem4=4）＋親キー（`parent`）を保持するよう修正し、`items_checked` を **45,836 → 60,952** に再計測。重複/欠番検査も level≥1 の細目に対して親 item 単位で正しく scoped に行うよう修正（NUMBERING が親ごとに割り当てられるため）。
2. **枝番号（article branch）解決の基底条フォールバック**（`rules.py`）: `第20条の5` のように枝番号を指定した参照に対し、該当枝番号が存在しない場合でも同じ基底条番号（例: `第20条`, `第20条の2`）へフォールバックして一致扱いしていた。**該当枝番号が無い参照は存在しない記事として報告**するよう修正（false negative の解消）。結果として REF.ARTICLE.MISSING が 389 → 563 に再計測（+174 件が隠れていた参照欠落候補）。
3. **項指定の号の検査**（`rules.py`）: `第X条第2項第Y号` のような参照に対し、項番号を無視して同じ条の全項から号を探していた（例: 第一項の号2 が第二項の号2 の存在証明に流用される）。**項が指定されているときはその項の中だけ**を検索するよう修正し、項の不存在自体を報告済みの場合は細目検査をスキップ（二重計上を防止）。`_item_in_article` に `para_num` 引数を追加（後方互換デフォルト `None`）。

修正後の実測: verified-anomaly = **0 維持** / candidate 3,322 → **3,423**（内訳: REF.ARTICLE.MISSING 389→563、REF.DELETED 76→36、REF.PARA.MISSING 354→317、REF.SUPP.MISSING 90→97、その他は微差）。
いずれの候補も `candidate` であり、独立の法的レビューなしに欠陥と呼ばない。

**2026-11-16（続き）: 前文カバレッジと antecedent 水門（waterfall）の追加**

4. **附則/前文 paragraphs を synthetic article として包含**（`model.py`）: SupplProvision/MainProvision 直下の 8,932 前段落を所属 scope の synthetic article（`PREAMBLE:<n>`、`synthetic=True`）として実体化し、参照スキャナに乗せた。通算法律の基本構造規則（連番・重複・TOC・削除）は synthetic を除外するよう修正（misattribution 防止）。検証可能な参照を **461,067 → 476,500**（+15,433）に拡大し、内部解決可能な参照が 100,565 → 100,944、外部未解決が 151,999 → 157,983、未対応構文が 240,799 → 250,043 に変化した。articles_checked は 33,652 → 42,584（本文 33,652 + 前文 8,932）に再計測した。
6. **PAREN.UNBALANCED の再計測と既知の noise source**（`rules.py` emission は変更なし・記録のみ）: 再スキャンの結果、candidate 内訳 PAREN.UNBALANCED が 1,536 件（MAIN 472 件 / SupplProvision 1,064 件；内訳: Unclosed 647 / Unmatched closing 494 / Unterminated 395）。いずれも候補であり、独立の法的レビュー前に欠陥とは呼べない。附則の「読替え規定（仮定規定の写し）」では表形式に「（「対象事業年度」と読み替える。）」のような入れ子の括弧が高密度に含まれ、現行のブレースマッチャは引用の対応を取り違えるケースが多く見られるので、このクラスタの PAREN.UNBALANCED の大部分は false positive の可能性が高い（手動での判定は不能・独立レビュー要）。ここで記録を優越するのは「書籍面での括弧の対応のみを機械チェックしたもの」であり、「法律が括弧で意味を規定している」ことを保証するものではない。全ての候補記事の legal review は依然として必要である。

5. **antecedent 解決の水門（waterfall）**（`rules.py`）: 素の「第N号」参照を検証するとき、
   - 素の項目の直後に先行する他の記事参照（例: 「第百四十一条第二号」）を基準にしては
     しまうと、直前が同じ段落の別の号を指す場合に **法文にありえない誤検出** になる
     （例: 国内源泉所得第百三十八条第一項第四号 → 第141条に四号は存在せず候補化）。
   - 直近の先行 antecedent で解決できない場合、**appearance order の逆順で以前のバインドを順に** たどって item が存在すれば解決する（水門）。解決できたものは candidate として計上しない。
   - 手動スポットチェックで **法人税法の REF.ITEM.MISSING 全 3 件が antecedent 誤解決による偽候補** であることを確認したのを起点に導入した。
   - 結果: REF.ITEM.MISSING が 909 → 829、全体の候補が 3,518 → 3,438 に再計測。**verified-anomaly = 0 を維持。**
- 独立レビュー不在の候補たちは候補のまま扱う。本スイープの結果は絶対的な異常の不存在ではなく、
  有限ドメインでの反例不存在・no-missing-parser-bug の記録である。

**これらは「欠陥」ではありません。** いずれも独立の法的レビューで確定するまで候補扱いです。`verified-anomaly` は 0 件のままです。

## 4. PHASE D の機械検証範囲（意味形式化された条文）

すべて **actor scope / 定義層** の形式化であり、課税標準の計算・端数処理・例外の全結合・得税額との統合は**未着手**です。各モジュールは `Law id`/`Revision`/`sha256` を原文ピンで保持し、`cross_law.py` により台帳との照合を受けます（161 ファイル / 134 ピン留めモジュール一致 / 0 失敗）。

| 法令 | 条文 | モジュール | PR（base） |
|---|---|---|---|
| 所得税法 340AC0000000033 | 第2条第1項第3号・第5号・第3条 | `Residency.lean` `StatutoryModel.lean` | #1（main に出荷済 R1） |
| 法人税法 340AC0000000034 | 第2条第3号・第4号 | `CorpActor.lean` | #5（phase-c/common-semantics） |
| 国税通則法 337AC0000000066 | 第2条第1〜4号 | `TaxGeneral.lean` | #6（phase-d/corporate-actor-scope） |
| 同上 | 第2条第5号（納税者） | `Taxpayer.lean` | #7（同上の次） |
| 同上 | 第4条（優先規則・lex specialis） | `TaxGeneralPriority.lean` | #8 |
| 同上 | 第2条第10号（強制換価手続） | `TaxProcedure.lean` | #9 |
| 同上 | 第2条第8号（法定納期限） | `StatutoryDeadline.lean` | #10 |
| 同上 | 第2条第9号（課税期間） | `TaxationPeriod.lean` | #11 |
| 同上 | 第15条（納税義務の成立） | `ObligationArt15.lean` | #13 |
| 消費税法 363AC0000000108 | 第2条第3・4・7号 + 第5条第1項 | `ConsumptionTaxActor.lean` | #12 |
| 相続税法 325AC0000000073 | 第1条の3（actor scope） | `InheritanceTaxActor.lean` | #14 |
| 地方税法 325AC0000000226 | 第6条（公益等による不課税） | `LocalExemption.lean` | #15 |
| 同上 | 第7条（受益に因る不均一課税） | `LocalPrivilege.lean` | #16 |
| 同上 | 第24条第1項 actor scope（一〜四の二） | `LocalObligor.lean` | #18 |

すべての Phase D モジュールについて、**独立形式仕様（`*Spec.lean`）による健全性・整合性定理対**と、**DecidableEq による決定的スモークテスト（`*Tests.lean`）**を維持します。公理依存は全案 `propext` のみ、または 0 件（`lake env lean` で `#print axioms` を直接確認・CI ガード登録済み・100 件の print 登録（grep 計測））。**proof-of-anomaly はどこにもありません。**

## 5. 現在の完成率（完成判定への進捗）

### 計測できる完了率

- 対象母集団（e-Gov 税キーワード抽出）確定: **100%（327/327 登録済）**
- 原文取得率（ピン留め可能な法令）: **325/327 = 99.4%**（2 件は完全未施行・取得不能、成功件数に不算入）
- 構造監査実施率: **325/325 = 100%**（パース・監査とも失敗 0）
- 意味モデルの条文対応率: **actor scope 13 モジュール**（33,652 条中 ~0.04%）— すなわち**意味検証はほぼ未達**です。「全体系の構造監査完了＋部分的な意味検証完了」の状態を区別します
- 再現性: `lake build`（138 jobs・CI 再現可能）/ `lake clean` → `lake build` ×2 再現 / Python 単体テスト 74 件 / `validate_inventory.py` / `cross_law.py` — すべて CI に登録・有効
- 変異注入: `scripts/tests/test_mutation_injection.py` — 12 クラスで規律検査が検出に使われることを確認

### 検出候補と確定異常

| 区分 | 件数 |
|---|---|
| 未確定の監査候補 | **3,438**（すべて `candidate`、確定欠陥ではない） |
| 誤検出として確認されたもの | 0（個別レビューは未実施のため確証なし） |
| **verified-anomaly（確定した欠陥）** | **0**（該当なしを意味するのではなく、独立レビュー前は誰も欠陥と呼ばない） |

## 6. L1–L7 アーキテクチャの実装状況

| 層 | 状態 |
|---|---|
| L1 Legal Sources | **実装済**（pin・sha256・施行日・改正履歴を台帳＋`data/raw/` に固定） |
| L2 Legal Structure | **実装済・全件実行済**（`model.py` `rules.py` `audit.py` `sweep.py`；テスト 35 + 誤変更注入 12 クラス） |
| L3 Legal Semantics | **部分的**（TaxFinance 共通層＋actor/定義層 13 モジュール） |
| L4 Tax Computation | **一部着手（3 法令ぶん）**（所得税法 art. 89 IndividualIncomeTax.lean・法人税法 art. 66 CorporateTaxRate.lean・国税通則法 art. 118/119 端数切り捨て TaxRounding.lean・相続税法 art. 15-17 InheritanceTax.lean・消費税法 art. 29 ConsumptionTaxRate.lean・相続税法 art. 21-7 GiftTax.lean・印紙税法 art. 20 StampDuty.lean（含む art. 20(4)/(5) 複合合計の floor 適用切分 StampPenaltyFacts／stampAggregatePenalty： audit／uncancelled 構成要素が一つでもあれば ¥1,000 floor を全体に・declared-only のみの場合は免除）・相続税法 art. 18 InheritanceSurcharge.lean・相続税法 art. 20 InheritanceSuccessiveDeduction.lean・相続税法 art. 19-2 SpouseRelief.lean・法人税法 art. 67 CorporateSurtax.lean（特定同族会社の特別税率）・相続税法 art. 19 GiftAddBack.lean（相続開始前7年以内の贈与加算）・相続税法 art. 21-6 SpousalGiftDeduction.lean（贈与税の配偶者控除）・印紙税法 別表第一 StampTable.lean（第一〜三号 課税物件表の税率）・登録免許税法 別表第一（一）RegistrationTax.lean（不動産の登記の定率項目）・地方税法 道府県民税 LocalIncomeTax.lean（art. 34(2)基礎控除・(1)十号配偶者控除・art. 35 所得割の税率）・地方税法 市町村民税 LocalInhabitantTax.lean（art. 314の3 所得割の税率 6%/8%）・租税特別措置法 DeemedCapitalGainsCost.lean（art. 31の4 長期譲渡所得 概算取得費控除）・登録免許税法 RegistrationCommercialTax.lean（別表第一（二）第二十四号（一）イ 株式会社の設立の登記 資本金の千分の七・最低15万円）・相続税法 art. 17 InheritanceApportionment.lean（各相続人等の相続税額： 相続税の総額を当該財産を取得した者の課税価格割合で按分・満額・単調性）・租税特別措置法 art. 31の3 ResidentialTransferSpecialTax.lean（居住用財産を譲渡した場合の長期譲渡所得の課税の特例: 課税長期譲渡所得金額 ≤ ¥60,000,000 は百分の十／超は ¥6,000,000 + 百分の十五・連続点・単調・非適格時に art. 31(1) 一般税率へフォールバック）・租税特別措置法 art. 9の3の二 ListedDividendWithholding.lean（上場株式等の配当等に係る源泉徴収義務等の特例: 交付をする金額＋控除対象額に百分の十五／大口株主等に対する第一号配当等に百分の二十・控除対象額は所得税額を限度とする）・地方税法 art. 34 の障害者控除（¥260,000／特別障害者 ¥300,000／同居常況の特別障害者 ¥530,000 — DisabilityDeduction）・寡婦控除（¥260,000 widowDeduction）・ひとり親控除（¥300,000 singleParentDeduction）・医療費控除（閾値 = min(5%×所得合計 ¥100,000)・控除上限 ¥2,000,000 — medicalExpenseDeduction）・地方税法 art. 34(1)十二 特定親族特別控除（所得 ≤ ¥950,000 は ¥450,000／¥950,001〜¥1,150,000 は 630,000 − 2×(x−841,000) 段階控除／¥1,150,001〜¥1,200,000 は ¥60,000／¥1,200,001 超は ¥30,000 — specificDependentDeduction）・RegistrationCommercialTaxTable.lean（同 ロ〜ヨ・タ〜ナ・（二）外国会社・（三）清算： 合名合資／一般社団法人等の設立の登記 ¥60,000固定・合同会社の設立の登記 資本金の千分の七（最低¥60,000）・資本金の増加の登記 千分の七（最低¥30,000）・新設合併等による設立の登記（千分の一・五・直前資本金を超える部分は千分の七・最低¥30,000）・吸収合併による資本金の増加（千分の一・五・直前資本金超過部分は千分の七）・新設分割による設立（千分の七・最低¥30,000）・吸収分割による資本金の増加（千分の七・最低¥30,000）・相互会社設立 ¥300,000固定・新株予約権 ¥90,000固定・支店又は従たる事務所の設置 各¥60,000・本店等の移転 各¥30,000・取締役会等事項変更 ¥30,000固定・役員等事項変更 ¥30,000固定（資本金≤¥100,000,000 の場合は¥10,000）・支配人の選任等 ¥30,000固定・役員職務執行停止 ¥30,000固定・解散 ¥30,000固定・継続・回復・設立無効 ¥30,000固定・登記事項の変更・消滅・廃止 ¥30,000固定・登記の更正 ¥20,000固定・登記の抹消 ¥20,000固定・外国会社営業所設置 各¥90,000・初設置 ¥60,000固定・その他外国会社登記 ¥9,000固定・外国会社更正・抹消 ¥6,000固定・清算人登記 ¥9,000固定・清算人職務執行停止変更 ¥6,000固定・清算の結了 ¥2,000固定・清算その他変更・抹消 ¥6,000固定・特定目的会社設立 ¥30,000固定・その他特定目的会社 ¥15,000・特定目的会社抹消 ¥10,000・投資法人設立 ¥30,000固定・その他投資法人 ¥15,000・投資法人抹消 ¥10,000・有限責任事業組合契約の効力発生 ¥60,000・従たる事務所設置 ¥60,000・主従たる事務所の移転 ¥30,000・組合員に関する事項変更 ¥10,000・業務執行の停止・代行者選任 ¥30,000・その他有限責任組合契約 ¥30,000・更正 ¥20,000・抹消 ¥20,000・清算人登記 ¥6,000・その他清算 ¥6,000・清算結了 ¥2,000・更正・抹消 ¥6,000・投資事業有限責任組合契約の効力発生 ¥30,000・その他投資事業有限責任組合契約 ¥15,000・更正 ¥10,000・抹消 ¥10,000・清算人登記 ¥6,000・清算結了 ¥2,000・更正・抹消 ¥6,000・限定責任信託の定め ¥30,000・限定責任信託の新事務処理地事項 ¥15,000・その他限定責任信託 ¥15,000・更正 ¥10,000・抹消 ¥10,000・清算受託者 ¥6,000・清算結了 ¥2,000・更正・抹消 ¥6,000・個人の商業登記 商号新設 ¥30,000・支配人選任 ¥30,000・未成年者/後見人 ¥18,000・営業譲渡 ¥18,000・商号廃止/更正 ¥6,000・抹消 ¥6,000・支店 ¥9,000・支店抹消 ¥6,000・船舶管理人 ¥30,000・抹消回復/更正 ¥6,000・夫婦財産契約 ¥18,000・更正/変更 ¥6,000・抹消 ¥6,000）・法人税法 art. 57 CorporateLossCarryforward.lean（欠損金の繰越し: 前十年以内の欠損金の損金算入／ただし書（百分の五十上限・過年度使用分控除）／第十一項（中小法人等の読み替え: 所得の金額を上限））・法人税法 art. 64の5 CorporateGroupLossOffset.lean（損益通算: 通算対象欠損金額／通算対象所得金額 — プール（他社欠損金＋超過控除）×割合（自己通算前所得÷自社＋他社通算前所得）で各社に配分・対称版も）・消費税法 art. 28(1)(2)(3) ConsumptionTaxableBase.lean（課税標準: 対価の額／ただし書著しく低い役員譲渡は資産の価額／特定課税仕入れは支払対価の額／消費・使用・贈与は資産の価額 — 著しく低い等は caller-established）・消費税法 art. 28(4) ConsumptionTaxImportBase.lean（輸入課税貨物の課税標準: 関税定率法art.4〜4の9に準じた価格＋消費税以外の消費税等（附帯税除く）＋関税の額（附帯税除く）— 純粋加算・附帯税控除済みは caller-established）・消費税法 art. 30(1) ConsumptionTaxInputCredit.lean（仕入れに係る消費税額の控除: 課税標準額に対する消費税額から 課税仕入れ税額＋特定課税仕入れ税額（支払対価×7.8%）＋保税課税貨物税額 を控除 — underflow/還付は射程外、input≤output のとき正確）・消費税法 art. 30(2) 同モジュール Apportionment namespace（課税売上高>5億 または 課税売上割合<95% で按分: 区分明らかは「課税資産のみ+共通×割合」／区分不明は「合計×割合」— 割合算定・95%special rule は caller-established）・国税通則法 art. 67 NonpaymentSurcharge.lean（不納付加算税: 納税告知税額等×10%／2項の調査予知でない納付×5% — 正当理由・政令適用除外は caller-established、端数は TaxRounding 射程）・国税通則法 art. 66 UnreportedSurcharge.lean（無申告加算税: 1項 納付税額×15%（予知でないとき10%）・3項三段階 50万以下15%／50万超300万以下20%／300万超30%（軽減時各−5pt） — 累積納付税額の按分・2項加算・5項以降は NOT YET COVERED）・国税通則法 art. 60 DelinquencyTax.lean（延滞税: 年7.3%／年14.6% の利率と「納期限の翌日から二月を経過する日まで」の期間区分のみ — 日割り分母は pinned 条文に明示なく架空仮定を避け未モデル化、税額計算・特例・免除は NOT YET COVERED）・国税通則法 art. 58 RefundInterest.lean（還付加算金: 還付金等×年7.3%（art.60低率を再利用）・2項の差押送達翌日から7日／仮差押え期間は控除 — 日割り分母は条文に明示なく未モデル化、起算日・分割納付みなし等は NOT YET COVERED）・法人税法 art. 64の7 GroupLossRatio.lean（欠損金の通算: 割合は合計額零→零・1超→1キャップ／非特定欠損金配賦額＝金額×割合 の2規則のみ — 9163文字の配分規定全体・期間特定・特定欠損金額の除外等は NOT YET COVERED）・関税定率法 art. 4の5 CustomsValueAfterDamage.lean（変質又は損傷後の課税価格: 仮想課税価格−減価額 — 減価額・仮想価格は caller-established、過大減価の underflow は input≤output のときのみ正確、art.4〜4の4 の仮想価格算出は別スライス）・関税定率法 art. 4 CustomsTransactionPrice.lean（課税価格の決定の原則: 現実支払価格＋10項目の運賃等（輸入港運賃・仲介料・容器・包装・材料・工具・消費物品・技術役務・知財対価・売手帰属収益）、各項目は「含まれていない限度」で caller-established — 政令細目・特殊関係・代替算定は NOT YET COVERED）・関税定率法 art. 4の2 CustomsSimilarGoods.lean（同種又は類似の貨物の取引価格による決定: 双方あるときは同種を優先、同種がなければ類似、双方なければ art. 4の3 へ — 取引価格・政令調整は caller-established）・関税定率法 art. 4の3 CustomsDomesticValue.lean（国内販売価格又は製造原価に基づく決定: 国内販売価格から加工付加価額・手数料利潤経費・国内運賃・本邦公課を控除／製造原価に利潤一般経費・輸入港まで運賃を加算、申出があれば製造原価法を先立てる — 各額は caller-established）・関税定率法 art. 4の6 CustomsAirCargo.lean（航空貨物等の特例: 無償見本・緊急輸入貨物等は輸入港までの運賃等を通常运送方法による額に代替／携帯品・小売段階の個人的使用品・居住者への寄贈品は卸取引段階の価格とする — 該当性・政令額・各額は caller-established）・関税定率法 art. 3の3 CustomsSmallConsignment.lean（少額輸入貨物の簡易税率: 課税標準価格の合計額が二十万円以下で除外貨物・申出なしなら別表付表第二を適用 — 税率表そのものは未モデル化、適用可否ゲートのみ）・関税定率法 art. 4の7 CustomsExchangeRate.lean（価格の換算に用いる外国為替相場: 輸入申告の日の相場で換算、関税法第五条第一号貨物は同号に定める日 — 数値換算・丸め・相場値は財務省令委任で未モデル化、換算日の選択のみ）・関税定率法 art. 10(1) CustomsDamageReduction.lean（変質・損傷の関税軽減: 価格低下率基準の軽減（関税額×低下率）／差額（元の関税額−損傷後課税額）以内の軽減 — 低下率・損傷後税額・適用判断は caller-established、第2項以降は NOT YET COVERED）・関税定率法 art. 6 CustomsRetaliatoryDuty.lean（報復関税: 別表税率による関税のほか課税価格と同額以下の追加関税を課すことができる — 追加関税の上限をモデル化、国・貨物指定／WTO承認／政令細目・通常関税は caller-established）・相続税法 art. 21の12 GiftSpecialDeduction.lean（相続時精算課税の特別控除: 2500万円から既控除合計を控除した残額と控除後課税価格の低い方を控除 — 既控除額・控除後課税価格は caller-established）・相続税法 art. 21の13/26/17 InheritanceMiscRates.lean（相続時精算課税20%・立木評価時価×85%・各相続人税額の課税価格按分）・法人税法 art. 87/82の5/145の12 CorporateMiscRates.lean（退職年金等積立金1%・国際最低課税額90.7%・外国法人退職年金1%）・所得税法 art. 80/81/82/211/209の3/182/170 IncomeMiscDeductions.lean（寡婦27万・ひとり親35万・勤労学生27万控除／利益分配20%・補てん金15%・利子15%配当20%・分離課税20%/15%）・関税法 art. 14の5 CustomsProcedureRates.lean（換価代金からの充当: 公売・売却代金から関税に先だつ費用を控除した金額を限度 — 7の17/11 は計算式なしで NOT MODELLED）・租税特別措置法 art. 36/37の15/41の10 SpecialMeasuresMisc.lean（資産譲渡5000万円上限・貸付信託不足額控除・定期積金給付補填金15%分離課税 — 29の4 は NOT MODELLED）・法人税法 art. 82の13/82の21/145の8 CorporateGlobeRates.lean（GloBE: 国際最低課税残余額90.7%・国内最低課税額75.3%・外国法人国内最低75.3%）・所得税法 art. 208/175/179 IncomeWithholdingRates.lean（源泉徴収: 年金(−保険料対応額)×10%・利子15%配当20%・外国法人20%/10%/15% — 区分判定・政令計算は NOT MODELLED）・所得税法 art. 84/186の2 IncomeDependentDeductions.lean（扶養控除: 一般38万・特定63万・老人48万を人数倍 — 原文で58万ではなく48万を確認、186の2 は NOT MODELLED）・租税特別措置法施行令 art. 46の4 SpecialMeasuresCasinoRatio.lean（カジノ業務収入割合: 対価合計＋カジノ収入のうちカジノ収入が5%以下かを交差掛判定）・相続税法 art. 23/25 InheritanceAssetValuation.lean（地上権・永小作権の残存期間別割合表5/10/20/30/40/50/60/70/80/90%を時価に乗じる — 22/24 は NOT MODELLED）・所得税法 art. 86 IncomeBasicDeduction.lean（基礎控除: 2350万以下58万・2400万以下48万・2450万以下32万・2500万以下16万・超0、境界8点を smoke 確認）・法人税法 art. 145の4 ForeignCorpResidualRate.lean（外国法人 国際最低課税残余額90.7%）・租税特別措置法施行令 art. 25の18/40の5の2 SpecialMeasuresApportionment.lean（按分: 物納非課税部分／特定贈与者控除110万円×割合）・法人税法施行令 art. 79の2/82の3/83の4 CorpAssetCompression.lean（固定資産圧縮限度額＝帳簿価額×補助金等/取得費、達するまでmin）・所得税法 art. 74 IncomeSocialInsuranceDeduction.lean（社会保険料控除＝支払額を控除、該当性は caller-established）・登録免許税法 別表第一（一）(一)〜(五) RegistryRealEstateFeesP1A.lean（所有権保存/移転・地上権等・配偶者居住権・地役権一個1500円・抵当権設定 — 価額×千分率）・同 (六)〜(十) RegistryRealEstateFeesP1B.lean（抵当権移転・根抵当権・順位変更/先順位同意一件千円・信託）・同 (十一)〜(十五) RegistryRealEstateFeesP1C.lean（相続財産分離・仮登記16区分・表示変更/付記/抹消一個千円・抹消20個超一件二万円）・登録免許税法 別表第一（二）十〜十二 RegistryCopyrightFees.lean（著作権・出版権・著作隣接権 定額24件＋質権4/1000・信託2/1000）・同 十三〜十四 RegistryPatentFees.lean（特許権・実用新案権、原文「一万五千円」を採用）・同 十五〜十七 RegistryDesignTrademarkFees.lean（意匠権・商標権・回路配置利用権、育成者権は原文になく NOT MODELLED）・登録免許税法 別表第一（二）二 RegistryShipFees.lean（船舶の登記、千分の1.5は15/10000で Nat 符号化）・同 四〜四の四 RegistryPropertyRightsFees.lean（ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権）・同 六〜九 RegistryCorporateSecurityFees.lean（企業担保権・企業価値担保権等、Coordinator が千分の2.5/1.5 の10倍過大を訂正）・登録免許税法 別表第一（二）十九〜二十二の二 RegistryMiningFees.lean（鉱業権・砂鉱権・特定鉱業権・試掘権/貯留権、面積型十万平方メートル単価）・同 二十二〜二十五 RegistryForeignCompanyFees.lean（外国会社・投資法人等、千分の4/2＋定額42件）・同 二十六〜三十一 RegistryTrustMarriageFees.lean（投資法人・信託・夫婦財産契約等、原文が〜三十一を含むため全件モデル化）・登録免許税法 別表第一（二）三十三〜三十八 RegistryQualificationFeesJ1.lean（認定個人情報保護団体・警備員・カジノ・銀行等・電子決済代行・保険・信託）・同 三十九〜四十九 RegistryQualificationFeesJ2.lean（担保付社債信託事業・各種金融業登録、四十二・四十三は削除）・同 五十〜五十九 RegistryQualificationFeesJ3.lean（監査法人・公認会計士・消防設備等、デーミング/削除行は NOT COVERED）・地方税法施行令 art. 43の13 LocalTaxLightOilQuantity.lean（軽油引取数量の減少: 特約1/100・元売0.3%=30/10000）・同 art. 44の3 LocalTaxVehicleSnowRate.lean（自動車税積雪軽減: 原文「十分の〇・七五」を3/40に通分、4ヶ月で0.7、指示の「十分の一」は誤りで原文優先）・同 art. 56の89の6 LocalTaxInsuranceEstimate.lean（国保税額の見込: 前年度税額÷12×12・百円未満切り捨て、52の10の2は定義のみ NOT MODELLED）・地方税法施行令 art. 9の14/9の18 LocalTaxOrderRate99A.lean（政令で定める率 百分の九十九）・同 art. 9の22/35の4の5 LocalTaxOrderRate77.lean（99%・百分の七・七=77/1000、1000→77を三層検証）・租税特別措置法施行令 art. 24 SpecialOrderCapitalGainDeduction.lean（譲渡所得特別控除5000万円上限・優先順位、各控除額算定は NOT MODELLED）・地方税法施行令 art. 21の8 LocalTaxMedicalIncomeRatio.lean（医療収入割合≤3/10判定）・同 art. 56の50 LocalTaxOfficeApportionment.lean（従業者給与×床面積按分、Coordinator のファイル割当誤りをワーカーが原文で訂正）・租税特別措置法施行令 art. 26の27 SpecialOrderPensionMinimum.lean（公的年金控除最低額 118万/168万/90万円）・相続税法 art. 25 InheritanceAnnuityValuation.lean（定期金給付契約の権利の評価: 解約返戻金の定めなしは基礎額×90%、その他は解約返戻金 — 複利基礎額・予定利率は caller-established）・国税徴収法 art. 104の2 TaxCollectionNextBid.lean（次順位買受申込者: 下限＝max(見積価額, 最高入札価額−公売保証金)、適格＝最高未満かつ下限以上 — 15法目）・相続税法 art. 24(1) 一号〜三号 InheritanceAnnuityMaxima.lean（有期/無期/終身 = max(解約返戻金,一時金,基礎額)、無期は平均額÷予定利率）・同 art. 24(1)四号/24(3)(4) InheritanceAnnuityMinMax.lean（一時金＝給付金額、3項 min・4項 max）・同 art. 24(2)(5) InheritanceAnnuityDeathException.lean（死亡特例＝権利者分＋第三者分、5項「準用」は NOT MODELLED）・登録免許税法 別表第三十二号 五十九〜六十八 RegistrationQualificationFeesP2A.lean（信書便/消防検定/債権回収/通関/酒類（製造¥150,000・酒母¥90,000・もろみ¥120,000・販売¥30,000/¥90,000・小売条件解除¥60,000/箇所）/たばこ/塩/著作権等 登録・免許・許可）・登録免許税法 別表第三十二号 六十九〜七十五 RegistrationQualificationFeesP2B.lean（放射性同位元素10件¥90,000／研究施設¥90,000／共済¥150,000／水道4件¥90,000／食品検査¥150,000／特別用途表示¥150,000／採血¥150,000／臓器あつせん¥90,000）・登録免許税法 別表第三十二号 七十六〜八十二 RegistrationQualificationFeesP3C.lean（精神保健指定医研修機関・医薬品医療機器14件¥90,000/¥150,000・特定細胞加工物2件・介護試験問題作成・確定拠出年金運営管理・在宅就業支援・有料職業紹介6件・建築物環境衛生）・登録免許税法 別表第三十二号 八十三〜八十九 RegistrationQualificationFeesP3D.lean（労働安全衛生6件・作業環境測定3件・卸売市場2件・農産物検査3件・JAS6件・肥料4件・特定飼料3件）・登録免許税法 別表第三十二号 九十〜九十六 RegistrationQualificationFeesP4E.lean（食品循環資源・農林漁業民宿・木材・馬主・農林中央金庫代理業・電子決済代行・商品取引所・商品先物取引業等）・登録免許税法 別表第三十二号 九十七〜百二 RegistrationQualificationFeesP4F.lean（石油パイプライン・石油輸入・揮発油販売・LPガス・ガス小売10件・高圧ガス8件・熱供給）・登録免許税法 別表第三十二号 百三〜百十 RegistrationQualificationFeesP5G.lean（熱供給・小売電気14件・登録電気工事・エネルギー消費性能判定・工業用水道・深海底鉱業・アルコール事業・航空機製造等）・登録免許税法 別表第三十二号 百十一〜百十九 RegistrationQualificationFeesP5H.lean（電気用品検査・JIS認証・計量器校正・回路配置利用権・工業所有権・特定輸出機器・前払式割賦販売7件・フロン類再生・鉄道事業等）・登録免許税法 別表第三十二号 百二十〜百二十四 RegistrationQualificationFeesP6I.lean（鉄道・索道・軌道・運河開設・港湾技術基準・船舶製造施設・小型船造船業等）・登録免許税法 別表第三十二号 百二十五〜百二十九 RegistrationQualificationFeesP6J.lean（船舶等製造工事認定8件・海洋汚染防止9件・船舶保安規程・再資源化解体3件・船舶運航事業8件等）・登録免許税法 別表第三十二号 百三十〜百三十四 RegistrationQualificationFeesP7K.lean（船舶安全法認定8件・海洋汚染防止法9件・船舶保安規程・再資源化解体3件・船舶運航事業8件・港湾運送事業4件）・登録免許税法 別表第三十二号 百三十五〜百三十九 RegistrationQualificationFeesP7L.lean（内航海運・船舶職員登録10件・船員派遣・船員法登録3件・航空法許可10件・無人航空機3件・貨物利用運送8件）・登録免許税法 別表第三十二号 百四十〜百五十一 RegistrationQualificationFeesP8M.lean（証券金融・特定金融会社・貸金業・無尽業・金融サービス仲介・資金決済関連・有限責任監査法人・宅建業・不動産特定共同事業・マンション管理業等）・登録免許税法 別表第三十二号 百五十二〜百五十九 RegistrationQualificationFeesP8N.lean（測量業・広告物試験機関・構造設計講習機関・住宅性能評価・建築物エネルギー消費性能・緑地調査・廃棄物再生利用・太陽電池廃棄物再資源化・環境保全人材認定・特定原動機検査機関・希少野生動植物登録機関・遺伝子組換え登録検査機関・第三十二号 百六十 遺伝子組換え生物等輸入検査機関 ¥90,000（第三十二号 一〜百六十 全件モデル化））・租税特別措置法 art. 87の2 LowAlcoholDutySpecialRate.lean（低アルコール分の蒸留酒類等に係る酒税の税率の特例: アルコール分 < 11° は ¥100,000/kL／11°以上〜13°未満（リキュールは < 12°）は ¥100,000 + 10°超の一度ごとに ¥10,000/kL／カテゴリ外は非適格）・地方税法 art. 34(1)第十号の二 SpouseSpecialDeduction.lean（配偶者特別控除: 配偶者所得 ¥100万以下 → ¥330,000／¥100万〜¥130万 → ¥380,000 − taper(exceeds ¥931,000 の部分を ¥50,000 整数倍 − ¥30,000 切下・最多）／¥130万超 → ¥30,000／taxpayer ≤ ¥900万据置・¥900万超〜¥950万は 2/3×¥10,000 切上げ・¥950万超〜¥1,000万は 1/3×¥10,000 切上げ・¥1,000万超は適格外）・登録免許税法 別表第一（二）第三十二号 RegistrationQualificationFees.lean（人の資格の登録若しくは認定又は技能証明: 公認会計士 ¥60,000・外国公認会計士 ¥60,000・行政書士 ¥30,000・政治資金監査人 ¥15,000・弁護士 ¥60,000・外国法事務弁護士 ¥60,000・司法書士 ¥30,000・簡裁訴訟代理等業務認定 ¥5,000・土地家屋調査士 ¥30,000・民間紛争解決手続代理関係業務認定 ¥5,000・税理士 ¥60,000・技術士 ¥30,000・技術士補 ¥15,000・公認心理師 ¥15,000・医師又は歯科医師 ¥60,000・薬剤師 ¥30,000・保健師等 ¥9,000／登録事項変更 ¥1,000・歯科衛生士 ¥9,000・歯科技工士 ¥9,000・救急救命士 ¥9,000・言語聴覚士 ¥9,000・あん摩等 ¥9,000・柔道整復師 ¥9,000・管理栄養士 ¥15,000・理容師 ¥9,000・美容師 ¥9,000・社会福祉士 ¥15,000／介護福祉士・准介護福祉士 ¥9,000・精神保健福祉士 ¥15,000・獣医師 ¥30,000・獣医仮免状登録 ¥9,000・愛玩動物看護師 ¥9,000・社会保険労務士 ¥30,000／紛争解決手続代理業務試験合格の付記 ¥5,000・第一種作業環境測定士 ¥30,000・第二種 ¥15,000・キャリアコンサルタント ¥9,000・計量士 ¥30,000・情報処理安全確保支援士 ¥9,000・弁理士 ¥60,000・小型船舶操縦士（一級 ¥2,000・二級 ¥1,800・特殊 ¥1,500）・水先人（一級 ¥60,000・二級 ¥30,000・三級 ¥15,000）・海事補佐人 ¥30,000・海事代理士 ¥30,000・航空従事者技能証明： 定期運送用操縦士 ¥18,000・事業用操縦士 ¥7,500・自家用操縦士 ¥3,000・准定期運送用操縦士 ¥6,000・一等航空士又は航空機関士 ¥12,000・二等航空士 ¥7,500・航空通信士 ¥3,000・一等航空整備士 ¥9,000・二等航空整備士 ¥6,000・一等航空運航整備士 ¥6,000・二等航空運航整備士 ¥3,000・航空工場整備士 ¥9,000・一等無人航空機操縦士 ¥3,000・耐空検査員 ¥6,000・操縦技能審査員 ¥3,000・不動産鑑定士 ¥60,000・一級建築士 ¥60,000・一級建築基準適合判定資格者 ¥10,000／二級 ¥5,000／構造計算適合判定資格者 ¥10,000・マンション管理士 ¥9,000・測量士 ¥30,000／測量士補 ¥15,000・認定匿名加工医療情報作成事業者等（四件ともに ¥150,000）・認定個人情報保護団体 ¥90,000・警備員等登録講習機関 ¥90,000・登録誘引情報提供機関 ¥15,000・カジノ事業の免許 ¥150,000・カジノ施設供用事業の免許 ¥150,000・カジノ関連機器等製造業等の許可 ¥150,000・カジノ関連機器等外国製造業の認定 ¥150,000・電子決済等取扱業者等（銀行・信金・信用協同組合の電子決済等取扱業者登録 ならびに 認定電子決済等取扱事業者協会等の認定 各 ¥150,000・電子決済等代行業者等（銀行・信用金庫・労働金庫・信用協同組合の各電子決済等代行業者登録 ¥90,000／認定電子決済等代行事業者協会等の認定 各 ¥150,000）・保険業の新規免許 ¥150,000・少額短期保険業者の登録 ¥150,000・特定保険業の認可 ¥150,000・保険仲立人の登録 ¥90,000・特定保険募集人の登録 ¥15,000・保険金信託業務の認可 ¥150,000・保険持株会社に係る認可 ¥150,000・信託業の免許 ¥150,000・管理型信託会社の登録 ¥150,000・管理型外国信託会社の登録 ¥150,000・自己信託に係る事務に関する事業の登録 ¥150,000・特定大学技術移転事業承認事業者の登録 ¥150,000・信託契約代理店の登録 ¥90,000・担保付社債信託事業の免許 ¥150,000・企業価値担保権に関する信託業務の免許 ¥150,000・金融商品市場開設の免許等（十一項目： 市場開設免許・排出削減量取引市場認可・組織変更認可・店頭売買市場認可・外国市場取引認可・持株会社認可・金融商品取引業協会認定（¥150,000）・認定投資者保護団体認定（¥90,000）・自主規制業務認可 ¥150,000・金融商品取引業者の登録 ¥150,000・変更登録 ¥150,000・業務の認可 ¥150,000・引受業務許可 ¥90,000・取引所取引業務許可 ¥150,000・電子店頭デリバティブ取引等業務許可 ¥150,000・金融商品仲介業者登録 ¥90,000・信用格付業者登録 ¥90,000・投資運用関係業務受託業者登録／変更登録 ¥90,000・金融商品取引清算機関／外国金融商品取引清算機関の金融商品債務引受業免許 ¥150,000・連攜金融商品債務引受業務認可 ¥150,000・証券金融会社の免許 ¥150,000・特定金融会社等の登録 ¥150,000・貸金業者の登録 ¥150,000／貸金業務取扱主任者に係る登録講習機関の登録 ¥90,000・無尽業の免許 ¥150,000／無尽会社の出張所又は代理店の設置の認可 ¥90,000・金融サービス仲介業者の登録 ¥90,000／変更登録 ¥90,000／認定金融サービス仲介業協会の認定 ¥150,000・資金決済： 第三者型前払式支払手段の発行者の登録等 ¥150,000・為替取引分析業者の許可 ¥150,000・資金清算業の免許 ¥150,000・認定資金決済事業者協会の認定 ¥150,000・有限責任監査法人の登録 ¥150,000・登録上場会社等監査人の登録 ¥90,000・実務補習団体等の認定 ¥150,000・消費生活相談員に係る登録試験機関の登録 ¥150,000・特定適格消費者団体の認定 ¥15,000・電気通信事業者の登録 ¥150,000／認定送信型対電気通信設備サイバー攻撃対処協会の認定 ¥150,000／電気通信主任技術者に係る登録講習機関の登録 ¥90,000／端末機器に係る登録認定機関の登録 ¥90,000・特定電子メール登録送信適正化機関の登録 ¥90,000・認定認証事業者／認定外国認証事業者の認定 ¥90,000・認定電子委任状取扱事業者の認定 ¥90,000・五十四 無線局の免許（一般 ¥30,000／放送 ¥150,000）・無線局の登録 ¥30,000・検査等事業者／外国点検事業者／登録証明機関／登録周波数終了対策機関の登録 各 ¥90,000・五十五 認定基幹放送事業者 ¥90,000・登録一般放送事業者 ¥90,000・認定放送持株会社 ¥150,000）・相続税法 art. 19-3/19-4 InheritanceMinorDisabledDeduction.lean（未成年者控除 十万円×18歳達年数（一年未満切上げ）／障害者控除 十万円・特別障害者二十万円×85歳達年数（同切上げ）・超過部分の扶養義務者控除算定（`minorExcess`/`disabledExcess`）・`yearsCeil` 単調性）。Phase E の 2 モジュール: (a) PhaseECorpRates.lean（法人税法 art. 66 ↔ 租税特別措置法 art. 67の2(1)・art. 68(1)(2) の法人税率整合性: 19%<22%<23.2% の帯順序・¥10億以下で art. 66(3) と同値・超過分の分裂加法性・月数換算 cap・単調非減少・art. 67の2 と art. 66(3) が同一税率関数であること）、(b) SpecialGiftRate.lean（租税特別措置法 art. 70の2の5(1) 特定直系尊属贈与税率の特例 ↔ 相続税法 art. 21-7 一般税率: 両表が ¥2,000,000 以下で同値（kernel証明 `special_eq_general_le_2m`）・¥0以下・¥45,000,000 超までの特別表が一般表を上回らないサンプル支配（有界サンプル・普遍証明ではない）・適格ゲート・¥600,000 控除後計算・非適格時フォールバック）、(c) StampDutySpecial91.lean（租税特別措置法 art. 91(1)(2)（不動産譲渡契約書／建設工事請負契約書の印紙税特別税率）↔ 印紙税法 別表第一第一号／第二号 の一般税率（StampTable.lean モデル）: 普遍支配 `special91Item{1,2}_le_general`（kernel証明）・両表 ¥5,000,000 超同一・上位帯では特別表が一般表の半額より高い（60,000 vs 100,000）・適格ゲート・非適格時 Option フォールバック）。その他の L4（控除・予定納税・復興/防衛特別所得税・租税特別措置法ほか多く）は**未着手**） |
| L5 Formal Verification | **部分的**（L3 の各モジェールに sound/complete 定理対） |
| L6 Counterexample Discovery | **着手（v1・spec↔impl 有限領域反例検査）**`JapanTaxLaw/CounterexampleSweep.lean` — マージ済み L4 全モデル（~3,500 組の実点）で SPEC↔impl の一致をカーネルに `decide` させて証明。初検査で 2 件の spec↔impl 不一致を検出し（相次相続控除 r1/r2 の cap 周り）、法文に整合するよう修正。**普遍領域の反例の不存在・法的欠陥の発見は主張しない** |
| L7 Evidence and Reporting | **v2 実装済**（`docs/L7_LEDGER.md` — pins/audit/unsupported を機械生成・CI 再生成照合。`docs/L7_CANDIDATES_UNREVIEWED.csv` — **全 3,438 候補の行ごとレビュー状態**（全件 `review_status=unreviewed`）を CI が再生成照合）; `AUDIT_REPORT.md`・`INVENTORY.md` と併存 |

## 7. 既知の限界（必読）

1. **Lean が証明するのは形式モデルの内部命題のみです。** モデルと法文の対応は pin（law_revision_id・施行日・SHA-256 のバイト一致、`cross_law.py` による機械的照合）によってのみ担保されます。正当な解釈は保証しません。
2. **候補は未確定です。** 3,438 件の `candidate` は、かっこ不整合や参照先欠落に基づく機械検査の出力であり、法的欠陥の認定ではありません。独立の法的レビューなしに「抜け穴」「誤記」と呼べません。
3. 地方税条例（約 1,788 団体・団体ごと独立法源）、租税条約・通達・裁判例は**未対応**です。国税の現行法令一覧に含まれません。
4. PHASE F（改正影響）・**PHASE E の意味的横断検証（1モジュールのみ・法人税法×租税特別措置法）**・PHASE L6（反例探索の普遍領域）は**未着手/未完了**です。L4（税額計算）は 所得税法 art. 89・法人税法 art. 66・通則法 art. 118/119・相続税法 art. 15-17・消費税法 art. 29・相続税法 art. 21-7（贈与税）・印紙税法 art. 20（過怠税）・相続税法 art. 18（相続税額の加算）・相続税法 art. 20（相次相続控除）・相続税法 art. 19-2（配偶者軽減）・法人税法 art. 67（特定同族会社の特別税率）・相続税法 art. 19（相続開始前7年以内の贈与加算）・相続税法 art. 21-6（贈与税の配偶者控除）・印紙税法 別表第一第一〜三号（課税物件表）・登録免許税法 別表第一（一）（不動産の登記の定率項目）・地方税法 道府県民税 art. 34(2)/(1)十号/art. 35・地方税法 市町村民税 art. 314の3・租税特別措置法 art. 31の4・登録免許税法 別表第一（二）第二十四号（一）イ の最小スライスのみ着手済です。その他の L4（控除・予定納税ほか）は**未着手**です。
5. `verify` 関税法／租税特別措置法／印紙税法／登録免許税法／地方税の残りの膨大な条文は**未形式化**です。
6. 台帳の revision 自体は e-Gov API の応答に基づき `CurrentEnforced` を優先して選択していますが、候補 revision 選択の入力値・時刻依存性は `data/PROVENANCE.json` を参照してください。
7. **転記監査（transcription audit）の現在の射程**: `scripts/ci/transcription_audit.py`（CI ゲートに組込済み）は、主要モデル **25 モデル / 32 anchor チェック（1440 literal）**

地価税法 art. 22/23 LandValueTaxRate.lean（(課税価格−基礎控除)×3/1000、art.23 評価の原則は NOT MODELLED）・地方法人税法 art. 10 LocalCorporationTaxRate.lean（課税標準×103/1000、加算額 saturating 控除）・相続税法 art. 23の2 SpouseResidenceValuation.lean（配偶者居住権: 時価−時価×年数割×割合、政令按分・端数は NOT MODELLED）・（登録免許税法 別表第一（二）第二十四号（一）イ〜チ・相続税法 art. 19-2/19-3/19-4・租税特別措置法 art. 31の3 を含む）（相続税法 art. 19-3/19-4 未成年者控除・障害者控除を含む（法人税法 art. 66/67(1)(5)(6)・相続税法 art. 15/16/18/19/20/21-5/21-6/21-7・所得税法 art. 89・国税通則法 art. 118(1)/119(1)・印紙税法 art. 20（含む art. 20(2)/(3)/(4)/(5)）・別表第一第一号/第二号・租税特別措置法 art. 31の4/67の2/68/70の2の5/91・消費税法 art. 29・地方税法 art. 34(2)/(1)十号（配偶者控除の 3 区分含む）/art. 314の3/art. 35・登録免許税法 別表第一（一）**全15項目の採用 literal（`realEstateMilleRate` の全枝）**/（二）第二十四号（一）イ）の literal が pinned raw bytes に存在することを機械検査します。未検査のモデル（**LocalIncomeTax art. 34 のその他の控除（生命保険料控除等）・LocalExemption/Privilege/Obligor・KanzeiGoods（定義分類器・literal なし）・RegistrationTax の未採用帯域・RegistrationCommercialTax の未採用帯域（ホ／ト）・ConsumptionTaxRate の次のアンカー外・InheritanceSurcharge art. 17・StampDuty の集計ロジック詳細・CounterexampleSweep-covered impls・L3 actor モジュール**）の literal 転記は**目視のみ**で機械監査していません（`NOT YET COVERED` として監査出力にも毎回表示）。監査は転記のみの検査であり、意味解釈・適用範囲・本文との整合は一切検査しません。・所得税法 art. 203の3 PublicPensionWithholding.lean（公的年金源泉徴収 5%/超過分・第七号10%、162,500×月数閾値 — 各号控除額・政令月割額は NOT MODELLED）・地方税法 art. 596 SpecialLandHoldingTax.lean（特別土地保有税 = 課税標準×税率−min(税額, 控除価格×1.4%/4%)）・法人税法施行令 art. 139の10 RetainedAmountLocalTax.lean（(法人税額−税額控除)×104/1000−min(寄附金×40%, 調整地方税額×20%)）・地方税法 art.72の49の14 BusinessOwnerDeduction.lean（事業主控除290万円・月割290万×月数÷12、月数は caller-established）・地方税法施行令 art.35の4の6 StandardRateExcessRatio.lean（標準税率超過率 = (基準事業税額−標準税率相当額)/基準事業税額、分母0→0）・地方税法施行令 art.26 IntermediateSurchargeRefund.lean（延滞金還付 = 延滞金額×還付額/中間納付額、ただし書は第一号−第二号）・租税特別措置法 art.41の3の11 IncomeAdjustmentDeduction.lean（所得金額調整控除: (min給与1000万−850万)×10%、第2項min10万合計−10万）・同 art.41の19 SpecialBaselineIncomeTax.lean（基準所得3.3億超部分×225/1000(22.5%)−基準所得税額）・租税特別措置法施行令 art.26の12 DiscountBondRefund.lean（割引債還付: (券面−償還)×徴収税率、外国法人分発行差金国内割合）・所得税法 art.205 IncomeArt205Withholding.lean（源泉徴収: 報酬10%、同一人一回100万円超部分20%）・租税特別措置法施行令 art.25の16 InheritedPropertyTransferGain.lean（相続財産譲渡所得: 相続税額×割合を残額で上限、収入<取得費なら0）・軽油引取税法施行令 art.23の2 LightOilBaseTax.lean（基準税額11,250円×四捨五入(数量×別表率)）・法人税法施行令 art.148 ConsolidationCreditLimit.lean（通算法人控除限度額 = 調整前控除限度額−控除限度調整額）・同 art.157 TrustPensionReserve.lean（信託退職年金積立金 = (一号+二号−三号−四号)×調整割合）・地方税法施行令 art.12 ResidentTaxTransitionalRates.lean（市町村民税経過措置: 均等割290/150/430/230円・所得割×80%・制限×1.5）・所得税法施行令 art.40 NonTaxSavingsCeiling.lean（非課税貯蓄申告書の最高限度額 = 一万円×整数、上限300万円＝300万円−第四号の最高限度額の合計額、saturating）・地価税法 art.18 LandValueTaxBasicDeduction.lean（基礎控除 = max(一号額, 二号額)、一号=十億/十五億円、二号=三万円/㎡×面積×割合×1/2、art.17 適用判定は NOT MODELLED）・特別交付税省令 art.10 SpecialDeliveryTaxMarch.lean（東日本大震災道府県三月分 = 算定額+各号合算額、〇・八=8/10/〇・七=7/10、表示単位千円・四捨五入、附則各号算定は NOT MODELLED）・租税特別措置法施行規則 art.9 ExplorationReserve.lean（探鉱準備金 = (販売収入−鉱物等取得額)×一号額/二号額、法22条鉱物定義・選鉱後価格は NOT MODELLED）・消費税法施行令 art.70の10 QualifiedInvoiceTaxAmount.lean（適格請求書消費税額: 税抜×10/100（軽減8/100）、税込×10/110（軽減8/108）、一円未満端数処理は caller-established、区分方法は NOT MODELLED）・法人特別税法 art.9 CorporateSpecialTaxBase.lean（課税標準 = 基準法人税額−年400万円、一年未満は400万円÷12×月数、最後の事業年度按分・月数暦計算は NOT MODELLED）・奄美群島税法施行令 art.6 AmamiCurrencyConversion.lean（通貨換算 = 金額×3、一円につき三円）・とん税法 art.3 TonnageTax.lean（とん税 = 純トン数（一トンまでごとに切り上げ）×16円/48円）・揮発油税法施行令 art.2 GasolineDeduction.lean（欠減 control除 = 数量×135/10000、百分の一・三五）・国税徴収法施行令 art.42の5 AuctionDepositValuation.lean（公売保証金を徴しない見積価額 = 五十万円、定数）・地方揮発油譲与税法 art.5 GasolineTransferRounding.lean（譲与額 = 計算額−千円未満の端数、千円単位切り捨て）・相続税法施行令 art.12の4 LegalRatePresentValue.lean（現価割合 = 1/(1+法定利率)^存続年数、小数点以下三位四捨五入）・国税庁関係政令 art.120 RefundRounding.lean（還付金等の端数計算: 一円未満切捨て・一円未満は一円、還付加算金百円未満/千円未満切捨て、基礎額一万円未満切捨て、利率・期間算定は NOT MODELLED）・関税法施行令 art.70の3 CustomsStorageFee.lean（収容に要した費用 = 保管日数×重量トン/容積m³「一トンまでごとに」切り上げ×180円、運搬・公告・通信費・端数準用は NOT MODELLED）・地方税法施行規則 art.16の4の4 TobaccoTaxFixedAmount.lean（たばこ税課税定額 = A×((C×2)/B)、千円未満を切り上げ、A/B/C は caller-established、法485条の13詳細は NOT MODELLED）・地方税等減収補てん臨時交付金政令 art.5 RoadGrantAllocation.lean（交付金総額=四十五億九千五百万円、按分=総額×基準額/合計、端数処理・他2種の交付金は NOT MODELLED）・自動車重量譲与税法 art.2 WeightTaxTransfer.lean（譲与対象=税額×333/357、半分を道路延長・半分を面積で按分、道路算定・補正は NOT MODELLED）・関税定率法改正法 附則 art.2 TransitionalTariffRate.lean（経過期間の税率: （2）B=一リットル1400円・（4）D=139円、関税額=リットル×税率、第三条の二の詳細は NOT MODELLED）・関税暫定措置法 附則 art.2-2 ProvisionalTariffRate.lean（経過期間の税率: （1）D=1600円/L・（2）B=1300円/L・（3）G=1600円/L・（4）D=137円/L、第八条の五の算定は NOT MODELLED）・税制改革関連法 art.9 ReformDoubleBasicDeduction.lean（遺産に係る基礎控除等を二倍に引き上げる = base×2、税率区分拡大・最高税率引下げ・配偶者非課税範囲拡大は NOT MODELLED）・特別とん税法 art.10 TonnageTaxPenalty.lean（罰則の数値上限: 三年以下の拘禁刑・五十万円以下の罰金、併科可能性、未遂も例による — 犯罪成立要件・未遂範囲・徴収手続は NOT MODELLED）・関税法施行令 art.7 CertFee.lean（証明書類交付手数料: 紙400円/電子300円、統計記録媒体23,500円、n枚合計=n×一枚額 — 区分ごとの集計手続・申請認定・集計行為は NOT MODELLED）・森林環境譲与税法 art.31 ForestGrantRounding.lean（譲与額の千円未満端数を控除=1000円単位切捨て — 算定手続 NOT MODELLED）・相続税法施行令 art.5の2 MultiDonorDeduction.lean（特定贈与者2人以上の控除額=60万円×各者割合 — 端数処理・認定 NOT MODELLED）・税理士法施行令 art.6の2 ExamFee.lean（受験手数料: 1科目4000円、n科目 4000+1500(n-1)、法9条2項8800円 — 申請区分認定・減免・納付手続 NOT MODELLED）・関税法施行令 art.12 DutyFreeTransfer.lean（免税物品譲渡の価格閾値: 一万八千円に満たない=price<18000、使用・贈与の認定と許可手続は NOT MODELLED）・納税貯蓄組合法 art.8 SavingsDepositInterest.lean（預金利子非課税の例外: 引出額 ten万円超=amount>100000、委託例外・期間認定は NOT MODELLED）・酒税法施行令 art.12の3 PowderSakeQuantity.lean（粉末酒数量=重量kg×0.73、リットル×100=kg×73 の厳密表現 — 端数処理・重量測定は NOT MODELLED）・たばこ税法 art.11 TobaccoRate.lean（税率 6802円/千本 — 特定販売業者特例・課税標準は NOT MODELLED）・印紙税法施行規則 art.9 StampExchangeFee.lean（交換手数料: 5円/枚、十円未満は半額切捨て — 認定・合計手続 NOT MODELLED）

## 8. 再現手順（第三者向け）

```sh
python -m unittest scripts.tests.test_structural_audit scripts.tests.test_mutation_injection \
  scripts.tests.test_inventory_selection scripts.tests.test_cross_law   # 66 tests
python scripts/law_audit/inventory/validate_inventory.py                # 台帳整合
python scripts/law_audit/phase_e/cross_law.py                           # Lean pin vs 台帳
lake build                                                              # Lean 410 jobs
lake clean && lake build                                                # 再現性（×2 CI 登録）
```

## 9. 完了判定への到達物と未達物

**到達（証拠あり）**: L1 実装・L2 全件実行・L3 の共通層と actor scope 11 法令 13 モジュール・CI 再現性・誤変更注入・台帳検証 — すべて `main` 以降の stacked PR #1–#18 に存在します。

**未達**: L3 の残り全条文・L4・L5 の全条文証明・L6・L7 統合レポート・関税定率法等のカテゴリー全体・地方税条例・改正影響（F）・全 target 法令の meaning に対する end-to-end 監査。

**完成判定ではありません。** 本システムは「部分的な意味検証＋完全な構造監査＋検証範囲の記録」までの段階です。
