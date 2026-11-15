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
| **PHASE E — 法令横断検証** | **着手（シード）** `scripts/law_audit/phase_e/cross_law.py` | 実 `JapanTaxLaw/*.lean` のピン留め vs 台帳整合を検査; 12 テスト; **意味横断検証は未完了** |
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

すべて **actor scope / 定義層** の形式化であり、課税標準の計算・端数処理・例外の全結合・得税額との統合は**未着手**です。各モジュールは `Law id`/`Revision`/`sha256` を原文ピンで保持し、`cross_law.py` により台帳との照合を受けます（107 ファイル / 80 ピン留めモジュール一致 / 0 失敗）。

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
- 再現性: `lake build`（110 jobs・CI 再現可能）/ `lake clean` → `lake build` ×2 再現 / Python 単体テスト 74 件 / `validate_inventory.py` / `cross_law.py` — すべて CI に登録・有効
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
| L4 Tax Computation | **一部着手（3 法令ぶん）**（所得税法 art. 89 IndividualIncomeTax.lean・法人税法 art. 66 CorporateTaxRate.lean・国税通則法 art. 118/119 端数切り捨て TaxRounding.lean・相続税法 art. 15-17 InheritanceTax.lean・消費税法 art. 29 ConsumptionTaxRate.lean・相続税法 art. 21-7 GiftTax.lean・印紙税法 art. 20 StampDuty.lean・相続税法 art. 18 InheritanceSurcharge.lean・相続税法 art. 20 InheritanceSuccessiveDeduction.lean・相続税法 art. 19-2 SpouseRelief.lean・法人税法 art. 67 CorporateSurtax.lean（特定同族会社の特別税率）・相続税法 art. 19 GiftAddBack.lean（相続開始前7年以内の贈与加算）・相続税法 art. 21-6 SpousalGiftDeduction.lean（贈与税の配偶者控除）・印紙税法 別表第一 StampTable.lean（第一〜三号 課税物件表の税率）・登録免許税法 別表第一（一）RegistrationTax.lean（不動産の登記の定率項目）・地方税法 道府県民税 LocalIncomeTax.lean（art. 34(2)基礎控除・(1)十号配偶者控除・art. 35 所得割の税率）・地方税法 市町村民税 LocalInhabitantTax.lean（art. 314の3 所得割の税率 6%/8%）・租税特別措置法 DeemedCapitalGainsCost.lean（art. 31の4 長期譲渡所得 概算取得費控除）。その他の L4（控除・予定納税・復興/防衛特別所得税・租税特別措置法ほか多く）は**未着手**） |
| L5 Formal Verification | **部分的**（L3 の各モジェールに sound/complete 定理対） |
| L6 Counterexample Discovery | **着手（v1・spec↔impl 有限領域反例検査）**`JapanTaxLaw/CounterexampleSweep.lean` — マージ済み L4 全モデル（~3,500 組の実点）で SPEC↔impl の一致をカーネルに `decide` させて証明。初検査で 2 件の spec↔impl 不一致を検出し（相次相続控除 r1/r2 の cap 周り）、法文に整合するよう修正。**普遍領域の反例の不存在・法的欠陥の発見は主張しない** |
| L7 Evidence and Reporting | **v1 実装済**（`docs/L7_LEDGER.md` — pins/audit/unsupported/review-state を CI が毎回再生成照合・不一致で FAIL）; `AUDIT_REPORT.md`・`INVENTORY.md` と併存 |

## 7. 既知の限界（必読）

1. **Lean が証明するのは形式モデルの内部命題のみです。** モデルと法文の対応は pin（law_revision_id・施行日・SHA-256 のバイト一致、`cross_law.py` による機械的照合）によってのみ担保されます。正当な解釈は保証しません。
2. **候補は未確定です。** 3,438 件の `candidate` は、かっこ不整合や参照先欠落に基づく機械検査の出力であり、法的欠陥の認定ではありません。独立の法的レビューなしに「抜け穴」「誤記」と呼べません。
3. 地方税条例（約 1,788 団体・団体ごと独立法源）、租税条約・通達・裁判例は**未対応**です。国税の現行法令一覧に含まれません。
4. PHASE F（改正影響）・PHASE E の意味的横断検証・PHASE L6（反例探索）は**未着手**です。L4（税額計算）は 所得税法 art. 89・法人税法 art. 66・通則法 art. 118/119・相続税法 art. 15-17・消費税法 art. 29・相続税法 art. 21-7（贈与税）・印紙税法 art. 20（過怠税）・相続税法 art. 18（相続税額の加算）・相続税法 art. 20（相次相続控除）・相続税法 art. 19-2（配偶者軽減）・法人税法 art. 67（特定同族会社の特別税率）・相続税法 art. 19（相続開始前7年以内の贈与加算）・相続税法 art. 21-6（贈与税の配偶者控除）・印紙税法 別表第一第一〜三号（課税物件表）・登録免許税法 別表第一（一）（不動産の登記の定率項目）・地方税法 道府県民税 art. 34(2)/(1)十号/art. 35・地方税法 市町村民税 art. 314の3・租税特別措置法 art. 31の4 の最小スライスのみ着手済です。その他の L4（控除・予定納税ほか）は**未着手**です。
5. `verify` 関税法／租税特別措置法／印紙税法／登録免許税法／地方税の残りの膨大な条文は**未形式化**です。
6. 台帳の revision 自体は e-Gov API の応答に基づき `CurrentEnforced` を優先して選択していますが、候補 revision 選択の入力値・時刻依存性は `data/PROVENANCE.json` を参照してください。

## 8. 再現手順（第三者向け）

```sh
python -m unittest scripts.tests.test_structural_audit scripts.tests.test_mutation_injection \
  scripts.tests.test_inventory_selection scripts.tests.test_cross_law   # 66 tests
python scripts/law_audit/inventory/validate_inventory.py                # 台帳整合
python scripts/law_audit/phase_e/cross_law.py                           # Lean pin vs 台帳
lake build                                                              # Lean 110 jobs
lake clean && lake build                                                # 再現性（×2 CI 登録）
```

## 9. 完了判定への到達物と未達物

**到達（証拠あり）**: L1 実装・L2 全件実行・L3 の共通層と actor scope 11 法令 13 モジュール・CI 再現性・誤変更注入・台帳検証 — すべて `main` 以降の stacked PR #1–#18 に存在します。

**未達**: L3 の残り全条文・L4・L5 の全条文証明・L6・L7 統合レポート・関税定率法等のカテゴリー全体・地方税条例・改正影響（F）・全 target 法令の meaning に対する end-to-end 監査。

**完成判定ではありません。** 本システムは「部分的な意味検証＋完全な構造監査＋検証範囲の記録」までの段階です。
