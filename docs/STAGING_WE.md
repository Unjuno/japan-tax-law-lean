# STAGING — W-E (登録免許税法 別表第一（二）第三十二号 九十〜九十六 の flat fee) 受け渡しメモ

> 実装担当 W-E からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP4E.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP4ESpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP4ETests.lean` | 新規 |
| `docs/STAGING_WE.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees.lean / P2A / P2B / P3C / P3D と同一ピン）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\art32_90_96.txt`（九十〜九十六、UTF-8、2,761 bytes）。
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 / 十五万円→150,000 /
一万五千円→15,000 / 三万円→30,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（九十〜九十六）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 九十 | 食品循環資源 登録再生利用事業者の登録 | 1 |
| 九十一 | 農林漁業体験民宿業者 (一) ＋ 登録実施機関 (二) | 2 |
| 九十一の二 | 木材関連事業者 (一) ＋ 登録実施機関 (二) | 2 |
| 九十二 | 馬主の登録 | 1 |
| 九十三 | 農林中央金庫 外国業務委託認可 (一) ＋ 代理業許可 (二) ＋ 特定信用事業代理業許可（農協 (三)／水協 (四)） | 4 |
| 九十三の二 | 電子決済等代行業者等の登録 (一)(二)(三) ＋ 認定事業者協会の認定 (四)(五)(六) | 6 |
| 九十四 | 商品取引所の設立・市場開設・組織変更・持株会社・類似施設の開設・変更の許可 (一)〜(七) | 7 |
| 九十五 | 商品先物取引業の許可・仲介業者の登録・債務引受業の許可・委託者保護基金の設立認可 (一)〜(四) | 4 |
| 九十六 | 商品投資顧問業の許可 (一) ＋ 業務の種類の変更の認可 (二) | 2 |
| 九十六の二 | 商工組合中央金庫電子決済等代行業者の登録 (一) ＋ 認定事業者協会の認定 (二) | 2 |
| **合計** | | **31** |

内訳（件数）: 九十 1 / 九十一 2 / 九十一の二 2 / 九十二 1 / 九十三 4 / 九十三の二 6 /
九十四 7 / 九十五 4 / 九十六 2 / 九十六の二 2 ＝ **31 件**。
本範囲には割合（千分の△）やデーミング規定はなく、金額なしの行もありません（全 31 行が一件につきの固定額）。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（31 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 九十 | `foodRecyclingRegistrantRegFee` | 90_000 | 九万円 |
| 2 | 九十一（一） | `farmStayBizRegFee` | 15_000 | 一万五千円 |
| 3 | 九十一（二） | `farmStayRegOrgRegFee` | 90_000 | 九万円 |
| 4 | 九十一の二（一） | `timberRelatedBizRegFee` | 15_000 | 一万五千円 |
| 5 | 九十一の二（二） | `timberRegOrgRegFee` | 90_000 | 九万円 |
| 6 | 九十二 | `horseOwnerRegFee` | 90_000 | 九万円 |
| 7 | 九十三（一） | `norinchukinForeignOutsourceApprovalFee` | 90_000 | 九万円 |
| 8 | 九十三（二） | `norinchukinAgencyPermitFee` | 90_000 | 九万円 |
| 9 | 九十三（三） | `jaCreditAgencyPermitFee` | 90_000 | 九万円 |
| 10 | 九十三（四） | `fisheriesCreditAgencyPermitFee` | 90_000 | 九万円 |
| 11 | 九十三の二（一） | `norinchukinEpiAgentRegFee` | 90_000 | 九万円 |
| 12 | 九十三の二（二） | `jaEpiAgentRegFee` | 90_000 | 九万円 |
| 13 | 九十三の二（三） | `fisheriesEpiAgentRegFee` | 90_000 | 九万円 |
| 14 | 九十三の二（四） | `certNorinchukinEpiAssocCertFee` | 150_000 | 十五万円 |
| 15 | 九十三の二（五） | `certJaEpiAssocCertFee` | 150_000 | 十五万円 |
| 16 | 九十三の二（六） | `certFisheriesEpiAssocCertFee` | 150_000 | 十五万円 |
| 17 | 九十四（一） | `commodityExchangeEstabPermitFee` | 150_000 | 十五万円 |
| 18 | 九十四（二） | `intlEmissionMarketApprovalFee` | 150_000 | 十五万円 |
| 19 | 九十四（三） | `commodityOrgChangeApprovalFee` | 150_000 | 十五万円 |
| 20 | 九十四（四） | `commodityHoldingCoApprovalFee` | 150_000 | 十五万円 |
| 21 | 九十四（五） | `type1SimilarMarketFacilityPermitFee` | 150_000 | 十五万円 |
| 22 | 九十四（六） | `type2SimilarMarketFacilityPermitFee` | 150_000 | 十五万円 |
| 23 | 九十四（七） | `commodityChangePermitFee` | 30_000 | 三万円 |
| 24 | 九十五（一） | `commodityFuturesBizPermitFee` | 150_000 | 十五万円 |
| 25 | 九十五（二） | `commodityFuturesBrokerRegFee` | 90_000 | 九万円 |
| 26 | 九十五（三） | `commodityDebtAssumptionPermitFee` | 150_000 | 十五万円 |
| 27 | 九十五（四） | `clientProtectionFundApprovalFee` | 150_000 | 十五万円 |
| 28 | 九十六（一） | `commodityInvestAdvisorPermitFee` | 150_000 | 十五万円 |
| 29 | 九十六（二） | `commodityBizTypeChangeApprovalFee` | 30_000 | 三万円 |
| 30 | 九十六の二（一） | `shokochukinEpiAgentRegFee` | 90_000 | 九万円 |
| 31 | 九十六の二（二） | `certShokochukinEpiAssocCertFee` | 150_000 | 十五万円 |

金額一致の内訳: 九万円=13 件（90,000）／ 十五万円=14 件（150,000）／ 一万五千円=2 件（15,000）／
三万円=2 件（30,000）＝ 合計 31 件。pinned 原文の fee フレーズ出現数 13+14+2+2=31 と完全一致。

`RegistrationQualificationFeesP4ESpec.lean` は `spec` 接頭辞の独立定式 31 本 +
`agreeRegistrationQualificationFeesP4E : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP4E = true := by decide`。
`RegistrationQualificationFeesP4ETests.lean` は `example := by decide` のスモーク 31 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「更新の登録を除く。」「更新の許可を除く。」「政令で定めるものに限る。」
  「同項ただし書の金融商品市場の開設の業務又は金融商品債務引受業等に係るものを除く。」
  「同法第三百三十二条第二項第三号又は第三百四十二条第二項第三号の取引の対象となる商品又は商品指数の
  増加に係るものに限る。」「同法第五条第一項第六号（許可の申請）の業務の種類の増加に係るものに限る。」
  等の適用判定は **caller-established** とし、金額定数には反映していません（Bool は式に入れていません）。
- 八十九 以前・九十七 以降は NOT YET COVERED。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
needle は `_norm`（`re.sub(r"[\s　]+","",...)`）済みの形で記載しています（空白・全角空白除去済み）。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "九十食品循環資源に係る登録再生利用事業者の登録食品循環資源の再生利用等の促進に関する法律（平成十二年法律第百十六号）第十一条第一項（登録）の規定による登録再生利用事業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）農山漁村滞在型余暇活動のための基盤整備の促進に関する法律（平成六年法律第四十六号）第十六条第一項（農林漁業体験民宿業者の登録）の農林漁業体験民宿業者の登録登録件数一件につき一万五千円",
    "（二）農山漁村滞在型余暇活動のための基盤整備の促進に関する法律第十六条第一項の登録実施機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）合法伐採木材等の流通及び利用の促進に関する法律（平成二十八年法律第四十八号）第十五条（木材関連事業者の登録）の木材関連事業者の登録（更新の登録を除く。）登録件数一件につき一万五千円",
    "（二）合法伐採木材等の流通及び利用の促進に関する法律第十五条の登録実施機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）合法伐採木材等の流通及び利用の促進に関する法律第十五条の登録実施機関に係る登録（更新の登録を除く。）登録件数一件につき九万円九十二馬主の登録競馬法（昭和二十三年法律第百五十八号）第十三条第一項（馬主の登録）の馬主の登録登録件数一件につき九万円",
    "律第百五十八号）第十三条第一項（馬主の登録）の馬主の登録登録件数一件につき九万円九十三農林中央金庫の外国における業務の委託契約の締結に係る認可又は農林中央金庫等の代理業の許可（一）農林中央金庫の外国における業務の委託契約の締結に係る認可認可件数一件につき九万円",
    "（二）農林中央金庫法（平成十三年法律第九十三号）第九十五条の二第一項（許可）の農林中央金庫代理業の許可許可件数一件につき九万円",
    "（三）農業協同組合法（昭和二十二年法律第百三十二号）第九十二条の二第一項（許可）の特定信用事業代理業の許可許可件数一件につき九万円",
    "（四）水産業協同組合法（昭和二十三年法律第二百四十二号）第百六条第一項（許可）の特定信用事業代理業の許可許可件数一件につき九万円",
    "定信用事業代理業の許可許可件数一件につき九万円九十三の二農林中央金庫電子決済等代行業者等の登録又は認定農林中央金庫電子決済等代行事業者協会等の認定（一）農林中央金庫法第九十五条の五の二第一項（登録）の農林中央金庫電子決済等代行業者の登録登録件数一件につき九万円",
    "電子決済等代行事業者協会等の認定（一）農林中央金庫法第九十五条の五の二第一項（登録）の農林中央金庫電子決済等代行業者の登録登録件数一件につき九万円（二）農業協同組合法第九十二条の五の二第一項（登録）の特定信用事業電子決済等代行業者の登録登録件数一件につき九万円",
    "等代行業者の登録登録件数一件につき九万円（二）農業協同組合法第九十二条の五の二第一項（登録）の特定信用事業電子決済等代行業者の登録登録件数一件につき九万円（三）水産業協同組合法第百十条第一項（登録）の特定信用事業電子決済等代行業者の登録登録件数一件につき九万円",
    "（四）農林中央金庫法第九十五条の五の七（認定農林中央金庫電子決済等代行事業者協会の認定）の認定農林中央金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円",
    "（五）農業協同組合法第九十二条の五の六（認定特定信用事業電子決済等代行事業者協会の認定）の認定特定信用事業電子決済等代行事業者協会の認定認定件数一件につき十五万円",
    "（六）水産業協同組合法第百十四条（認定特定信用事業電子決済等代行事業者協会の認定）の認定特定信用事業電子決済等代行事業者協会の認定認定件数一件につき十五万円",
    "（一）商品先物取引法（昭和二十五年法律第二百三十九号）第九条（設立の許可）の会員商品取引所の設立の許可又は同法第七十八条（株式会社商品取引所の許可）の株式会社商品取引所の許可許可件数一件につき十五万円",
    "（二）商品先物取引法第三条第一項ただし書（国際協力排出削減量に係る取引を行う市場の開設等の認可）の認可（同項ただし書の金融商品市場の開設の業務又は金融商品債務引受業等に係るものを除く。）認可件数一件につき十五万円",
    "排出削減量に係る取引を行う市場の開設等の認可）の認可（同項ただし書の金融商品市場の開設の業務又は金融商品債務引受業等に係るものを除く。）認可件数一件につき十五万円（三）商品先物取引法第百三十二条第一項（組織変更の認可）の組織変更の認可認可件数一件につき十五万円",
    "債務引受業等に係るものを除く。）認可件数一件につき十五万円（三）商品先物取引法第百三十二条第一項（組織変更の認可）の組織変更の認可認可件数一件につき十五万円（四）商品先物取引法第九十六条の二十五第一項又は第三項ただし書（認可等）の認可認可件数一件につき十五万円",
    "（五）商品先物取引法第三百三十二条第一項（第一種特定商品市場類似施設の開設の許可）の第一種特定商品市場類似施設の開設の許可許可件数一件につき十五万円",
    "（六）商品先物取引法第三百四十二条第一項（第二種特定商品市場類似施設の開設の許可）の第二種特定商品市場類似施設の開設の許可許可件数一件につき十五万円",
    "三百三十五条第一項（変更の許可等）（同法第三百四十五条（準用）において準用する場合を含む。）の規定による変更の許可（同法第三百三十二条第二項第三号又は第三百四十二条第二項第三号の取引の対象となる商品又は商品指数の増加に係るものに限る。）許可件数一件につき三万円",
    "（一）商品先物取引法第百九十条第一項（商品先物取引業の許可）の商品先物取引業の許可（更新の許可を除く。）許可件数一件につき十五万円",
    "（二）商品先物取引法第二百四十条の二第一項（登録）の商品先物取引仲介業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "新の許可を除く。）許可件数一件につき十五万円（二）商品先物取引法第二百四十条の二第一項（登録）の商品先物取引仲介業者の登録（更新の登録を除く。）登録件数一件につき九万円（三）商品先物取引法第百六十七条（許可）の商品取引債務引受業の許可許可件数一件につき十五万円",
    "仲介業者の登録（更新の登録を除く。）登録件数一件につき九万円（三）商品先物取引法第百六十七条（許可）の商品取引債務引受業の許可許可件数一件につき十五万円（四）商品先物取引法第二百七十九条第一項（認可の申請）の委託者保護基金の設立の認可認可件数一件につき十五万円",
    "（一）商品投資に係る事業の規制に関する法律（平成三年法律第六十六号）第三条（商品投資顧問業者の許可）の商品投資顧問業の許可（更新の許可を除く。）許可件数一件につき十五万円",
    "（二）商品投資に係る事業の規制に関する法律第九条（変更の認可）の規定による変更の認可（同法第五条第一項第六号（許可の申請）の業務の種類の増加に係るものに限る。）認可件数一件につき三万円",
    "（一）株式会社商工組合中央金庫法（平成十九年法律第七十四号）第六十条の三（登録）の商工組合中央金庫電子決済等代行業者の登録登録件数一件につき九万円",
    "（二）株式会社商工組合中央金庫法第六十条の二十一（認定商工組合中央金庫電子決済等代行事業者協会の認定）の認定商工組合中央金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 31 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 九十〜九十六（食品循環資源・農林漁業体験民宿・木材関連・馬主・農林中央金庫／農協／水協代理業・電子決済等代行・商品取引所／商品先物／商品投資顧問・商工組合中央金庫）↔ RegistrationQualificationFeesP4E.lean",
       "342AC0000000035", "file", None,
       [ ...上記 needles 31 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-E 担当分: 新規 check **31 needles** なので **+31**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP4E JapanTaxLaw.RegistrationQualificationFeesP4ESpec JapanTaxLaw.RegistrationQualificationFeesP4ETests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WEAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **31 本すべて** と `agreeRegistrationQualificationFeesP4E` の計 **32 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned 原文／pinned JSON を正規化テキストに対して `.find()`）: **31/31 FOUND、MISS 0 件**（§6）。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND /
  開始マーカー … FOUND。
- 金額一致: 全 31 件で日本語数字（九万円／十五万円／一万五千円／三万円）と Arabic 定数が一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned 原文 `art32_90_96.txt` と pinned JSON `law_full_text` を `transcription_audit.py` の `text()` と
同一ロジックで平坦化し、`_norm` と同じ `re.sub(r"[\s　]+", "", ...)` で正規化した文字列に対して
各 needle を Python の `.find()` で検索（needle 側も同正規化）。
`art@` は切り出しテキスト正規化上の offset、`json@` は pinned JSON 平坦化・正規化上の offset。
各 needle の出現回数は両方とも **1**（一意）。needle の長さはすべて **60〜130 文字**、31 本すべて相互に異なることを確認。
アンカーの勝手な変更・正規化・文字変換はしていません。

| # | def | 結果 | art@ | json@ | 出現回数 | 長さ |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `foodRecyclingRegistrantRegFee` | FOUND | 0 | 167383 | 1/1 | 110 |
| 2 | `farmStayBizRegFee` | FOUND | 150 | 167533 | 1/1 | 94 |
| 3 | `farmStayRegOrgRegFee` | FOUND | 244 | 167627 | 1/1 | 73 |
| 4 | `timberRelatedBizRegFee` | FOUND | 353 | 167736 | 1/1 | 93 |
| 5 | `timberRegOrgRegFee` | FOUND | 446 | 167829 | 1/1 | 65 |
| 6 | `horseOwnerRegFee` | FOUND | 446 | 167829 | 1/1 | 124 |
| 7 | `norinchukinForeignOutsourceApprovalFee` | FOUND | 530 | 167913 | 1/1 | 130 |
| 8 | `norinchukinAgencyPermitFee` | FOUND | 660 | 168043 | 1/1 | 63 |
| 9 | `jaCreditAgencyPermitFee` | FOUND | 723 | 168106 | 1/1 | 65 |
| 10 | `fisheriesCreditAgencyPermitFee` | FOUND | 788 | 168171 | 1/1 | 64 |
| 11 | `norinchukinEpiAgentRegFee` | FOUND | 829 | 168212 | 1/1 | 130 |
| 12 | `jaEpiAgentRegFee` | FOUND | 886 | 168269 | 1/1 | 130 |
| 13 | `fisheriesEpiAgentRegFee` | FOUND | 939 | 168322 | 1/1 | 130 |
| 14 | `certNorinchukinEpiAssocCertFee` | FOUND | 1069 | 168452 | 1/1 | 81 |
| 15 | `certJaEpiAssocCertFee` | FOUND | 1150 | 168533 | 1/1 | 81 |
| 16 | `certFisheriesEpiAssocCertFee` | FOUND | 1231 | 168614 | 1/1 | 78 |
| 17 | `commodityExchangeEstabPermitFee` | FOUND | 1426 | 168809 | 1/1 | 100 |
| 18 | `intlEmissionMarketApprovalFee` | FOUND | 1526 | 168909 | 1/1 | 106 |
| 19 | `commodityOrgChangeApprovalFee` | FOUND | 1551 | 168934 | 1/1 | 130 |
| 20 | `commodityHoldingCoApprovalFee` | FOUND | 1603 | 168986 | 1/1 | 130 |
| 21 | `type1SimilarMarketFacilityPermitFee` | FOUND | 1733 | 169116 | 1/1 | 74 |
| 22 | `type2SimilarMarketFacilityPermitFee` | FOUND | 1807 | 169190 | 1/1 | 74 |
| 23 | `commodityChangePermitFee` | FOUND | 1892 | 169275 | 1/1 | 130 |
| 24 | `commodityFuturesBizPermitFee` | FOUND | 2077 | 169460 | 1/1 | 65 |
| 25 | `commodityFuturesBrokerRegFee` | FOUND | 2142 | 169525 | 1/1 | 62 |
| 26 | `commodityDebtAssumptionPermitFee` | FOUND | 2120 | 169503 | 1/1 | 130 |
| 27 | `clientProtectionFundApprovalFee` | FOUND | 2174 | 169557 | 1/1 | 130 |
| 28 | `commodityInvestAdvisorPermitFee` | FOUND | 2330 | 169713 | 1/1 | 85 |
| 29 | `commodityBizTypeChangeApprovalFee` | FOUND | 2415 | 169798 | 1/1 | 92 |
| 30 | `shokochukinEpiAgentRegFee` | FOUND | 2559 | 169942 | 1/1 | 73 |
| 31 | `certShokochukinEpiAssocCertFee` | FOUND | 2632 | 170015 | 1/1 | 90 |

- **FOUND 31 / MISS 0**。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 / 一万五千円=15,000 /
  三万円=30,000）。pinned 原文の fee フレーズ出現数 13+14+2+2=31 と一致。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP3D*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP4E.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 九十〜九十六（食品循環資源・農林漁業体験民宿・木材関連・馬主・農林中央金庫／農協／水協代理業・電子決済等代行・商品取引所／商品先物／商品投資顧問・商工組合中央金庫）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 九十〜九十六（RegistrationQualificationFeesP4E.lean：31 件の flat fee 額を Money 定数化、八十九 以前・九十七 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP4E
import JapanTaxLaw.RegistrationQualificationFeesP4ESpec
import JapanTaxLaw.RegistrationQualificationFeesP4ETests
```

（W-A / W-B / W-C / W-D 各 3 件と併せて計 15 行の追加になる見込みです。メインが統合してください。
 W-E は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **九十〜九十六 のみ**。**八十九 以前・九十七 以降は NOT YET COVERED**。
- 登録・認定・認可・許可の要件・適用、「更新の登録を除く」「政令で定めるものに限る」等の該当性は
  すべて caller-established とし、法的判断の自動化はしていません。
- 本範囲には割合やデーミング規定はなく、金額なしの行はありません（全 31 行を fee def 化）。
- `agreeRegistrationQualificationFeesP4E` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+31）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-E は実行していません）。
