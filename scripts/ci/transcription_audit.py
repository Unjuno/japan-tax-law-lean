#!/usr/bin/env python3
"""L1 transcription audit: pinned raw law JSON -> the literal tables in the Lean models.

This audits **transcription fidelity only**: it asserts that the exact rate/amount
literal strings that the Lean L4 models are built on actually occur in the pinned,
byte-hashed e-Gov raw JSON for the current revision pins. It does NOT and cannot
check semantics, scope, exceptions, or legal interpretation. A passing audit means
"the model transcribed the pinned source's literals faithfully" — never
"the model is legally correct".

Design (v1): every check pins (law_id -> current_revision.law_revision_id) from
data/INVENTORY.json (the same ledger cross_law.py checks) and searches the flattened
article/table text for exact substrings (whitespace-normalised). Any miss -> FAIL.
The checker's literals are intentionally written next to the Lean model they back;
if a pin moves, the Lean module is next to change, and this audit is the gate that
forces the two to move together. That is the strongest claim made here.

Exit 0 iff every check passes; otherwise exit 1 and list the misses.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"


def _norm(s: str) -> str:
    return re.sub(r"[\s　]+", "", s)


def load_law_text(law_id: str) -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    rec = next((l for l in inv["laws"] if l["law_id"] == law_id), None)
    assert rec is not None, f"law {law_id} not in INVENTORY.json"
    snap = rec.get("raw_snapshot")
    assert snap, f"law {law_id} has no raw snapshot"
    path = REPO / snap["source_file"]
    data = json.loads(path.read_bytes())

    def text(node):
        if isinstance(node, str):
            return node
        if isinstance(node, dict):
            return "".join(text(c) for c in node.get("children", []))
        return ""

    return text(data.get("law_full_text", data))


def find_article_text(law_id: str, article_title: str) -> str | None:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    rec = next((l for l in inv["laws"] if l["law_id"] == law_id), None)
    snap = rec["raw_snapshot"]["source_file"]
    data = json.loads((REPO / snap).read_bytes())

    def text(node):
        if isinstance(node, str):
            return node
        if isinstance(node, dict):
            return "".join(text(c) for c in node.get("children", []))
        return ""

    def walk(node, in_main=False):
        if isinstance(node, dict):
            tag = node.get("tag")
            if tag == "MainProvision":
                in_main = True
            if tag == "Article" and in_main:
                yield node
                return
            for c in node.get("children", []):
                yield from walk(c, in_main)
        elif isinstance(node, list):
            for c in node:
                yield from walk(c, in_main)

    for a in walk(data.get("law_full_text", data)):
        title = "".join(text(c) for c in a.get("children", []) if c.get("tag") == "ArticleTitle").strip()
        if title == article_title:
            return text(a)
    return None


def contains(haystack: str, needle: str) -> bool:
    return _norm(needle) in _norm(haystack)


# Each check: (name, locator-fn) -> list of literal substrings that must occur.
def checks():
    cia = find_article_text  # alias for readability

    # 法人税法 art. 66 — CorporateTaxRate.lean
    yield ("法人税法 art. 66（法人税率）↔ CorporateTaxRate.lean (smeRate 19% / ordinaryRate 23.2% / 年800万円 cap / 資本金1億円以下)",
           "340AC0000000034",
           "article", "第六十六条",
           ["百分の二十三・二の税率", "百分の十九の税率", "年八百万円以下", "資本金の額若しくは出資金の額が一億円以下"])

    # 相続税法 art. 21-7 — GiftTax.lean
    yield ("相続税法 art. 21-7（贈与税の税率）↔ GiftTax.lean (giftRateTable 10/15/20/30/40/45/50%, 上限55%)",
           "325AC0000000073",
           "article", "第二十一条の七",
           ["二百万円以下の金額百分の十", "三百万円を超え四百万円以下の金額百分の二十",
            "六百万円を超え千万円以下の金額百分の四十", "千五百万円を超え三千万円以下の金額百分の五十",
            "三千万円を超える金額百分の五十五"])

    # 相続税法 art. 21-5 — GiftTax.lean (giftBasicDeduction)
    yield ("相続税法 art. 21-5（贈与税の基礎控除・六十万円）↔ GiftTax.lean (giftBasicDeduction 600_000)",
           "325AC0000000073",
           "article", "第二十一条の五",
           ["課税価格から六十万円を控除する"])

    # 所得税法 art. 89 — IndividualIncomeTax.lean
    yield ("所得税法 art. 89(1)（税率）↔ IndividualIncomeTax.lean (taxBands 5/10/20/23/33/40%, topTaxRate 45%)",
           "340AC0000000033",
           "article", "第八十九条",
           ["百九十五万円以下の金額百分の五", "三百三十万円を超え六百九十五万円以下の金額百分の二十",
            "九百万円を超え千八百万円以下の金額百分の三十三", "四千万円を超える金額百分の四十五"])

    # 印紙税法 別表第一 第一号 — StampTable.lean (contractStampDuty)
    yield ("印紙税法 別表第一 第一号（契約書）↔ StampTable.lean (contractStampDuty)",
           "342AC0000000023",
           "file", None,
           ["十万円以下のもの二百円十万円を超え五十万円以下のもの四百円",
            "五十万円を超え百万円以下のもの千円百万円を超え五百万円以下のもの二千円",
            "五百万円を超え千万円以下のもの一万円千万円を超え五千万円以下のもの二万円",
            "五十億円を超えるもの六十万円"])

    # 印紙税法 別表第一 第二号 — StampTable.lean (workContractStampDuty)
    yield ("印紙税法 別表第一 第二号（請負に関する契約書）↔ StampTable.lean (workContractStampDuty)",
           "342AC0000000023",
           "file", None,
           ["百万円以下のもの二百円百万円を超え二百万円以下のもの四百円",
            "二百万円を超え三百万円以下のもの千円三百万円を超え五百万円以下のもの二千円"])

    # 租税特別措置法 art. 31の4 — DeemedCapitalGainsCost.lean (pct 5%)
    yield ("租税特別措置法 art. 31の4（長期譲渡所得の概算取得費）↔ DeemedCapitalGainsCost.lean (transferPrice * 5 / 100)",
           "332AC0000000026",
           "article", "第三十一条の四",
           ["百分の五に相当する金額とする"])

    # 租税特別措置法 art. 67の2 — PhaseECorpRates.lean (specialMedicalCorpTax, 19%)
    yield ("租税特別措置法 art. 67の2(1)（特定の医療法人の法人税率の特例・百分の十九）↔ PhaseECorpRates.lean (specialMedicalCorpTax)",
           "332AC0000000026",
           "article", "第六十七条の二",
           ["百分の十九の税率により"])

    # 租税特別措置法 art. 68 — PhaseECorpRates.lean (coopSpecialCap 10億, excess 22%)
    yield ("租税特別措置法 art. 68(1)(2)（特定の協同組合等の法人税率の特例）↔ PhaseECorpRates.lean (coopSpecialCap 1_000_000_000, coopSpecialExcessRate 22%)",
           "332AC0000000026",
           "article", "第六十八条",
           ["十億円（事業年度が一年に満たない協同組合等については、十億円に当該事業年度の月数を乗じてこれを十二で除して計算した金額とする。）を超える部分の金額については、百分の二十二"])

    # 相続税法 art. 19-2 — SpouseRelief.lean (spouseReliefYiBasis, spouseReliefRelevantBasis, spouseRelief, taxAfterSpouseRelief)
    yield ("相続税法 art. 19-2（配偶者に対する相続税額の軽減・イの法定相続分／一億六千万円の下限額・ロの課税価格）↔ SpouseRelief.lean (spouseReliefYiBasis, spouseReliefRelevantBasis, spouseRelief, taxAfterSpouseRelief)",
           "325AC0000000073",
           "article", "第十九条の二",
           ["イ当該相続又は遺贈により財産を取得した全ての者に係る相続税の課税価格の合計額に民法第九百条（法定相続分）の規定による当該配偶者の相続分",
            "一億六千万円",
            "ロ当該相続又は遺贈により財産を取得した配偶者に係る相続税の課税価格に相当する金額"])

    # 租税特別措置法 art. 9の3の二 — ListedDividendWithholding.lean (listedDividendRate, withholdingBase, withholdingNet)
    yield ("租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例: 百分の十五（大口株主等については百分の二十）／控除対象額は所得税の額を限度とする）↔ ListedDividendWithholding.lean (listedDividendRate, withholdingGross, withholdingDeduction, withholdingNet)",
           "332AC0000000026",
           "article", "第九条の三の二",
           ["その交付をする金額（第三項の規定により控除する同項各号に定める金額がある場合には、当該金額その他の政令で定める金額を加算した金額）",
            "に百分の十五（第一号に掲げる配当等でその配当等の支払をする内国法人に係る大口株主等に対し交付をするものについては、百分の二十）の税率を乗じて計算した金額の所得税を徴収し",
            "当該各号に定める金額は、同項の規定により徴収して納付すべき当該上場株式等の配当等に係る所得税の額を限度として当該所得税の額から控除する"])

    # 租税特別措置法 art. 31の3 — ResidentialTransferSpecialTax.lean (residentialGainTax)
    yield ("租税特別措置法 art. 31の3（居住用財産を譲渡した場合の長期譲渡所得の課税の特例: ¥60,000,000 以下で百分の十／超で ¥6,000,000 + 百分の十五）↔ ResidentialTransferSpecialTax.lean (residentialGainTax, residentialBoundary)",
           "332AC0000000026",
           "article", "第三十一条の三",
           ["課税長期譲渡所得金額が六千万円以下である場合当該課税長期譲渡所得金額の百分の十に相当する金額",
            "課税長期譲渡所得金額から六千万円を控除した金額の百分の十五に相当する金額",
            "所有期間が十年を超えるもののうち居住用財産に該当するものの譲渡"])

    # 租税特別措置法 art. 70の2の5 — SpecialGiftRate.lean (specialGiftRateTable)
    yield ("租税特別措置法 art. 70の2の5(1)（直系尊属から贈与を受けた場合の贈与税の税率の特例）↔ SpecialGiftRate.lean (specialGiftRateTable)",
           "332AC0000000026",
           "article", "第七十条の二の五",
           ["二百万円以下の金額百分の十", "四千五百万円を超える金額百分の五十五"])

    # 租税特別措置法 art. 91 — StampDutySpecial91.lean (special91Item1 / special91Item2)
    yield ("租税特別措置法 art. 91(1)(2)（不動産譲渡契約書等に係る印紙税の税率の特例）↔ StampDutySpecial91.lean (special91Item1/2)",
           "332AC0000000026",
           "article", "第九十一条",
           ["十万円を超え五十万円以下のもの二百円", "五十万円を超え百万円以下のもの五百円",
            "百万円を超え二百万円以下のもの二百円", "五十億円を超えるもの四十八万円"])

    # 法人税法 art. 67 — CorporateSurtax.lean (特定同族会社の留保金額に対する加算税率 10/15/20%)
    yield ("法人税法 art. 67(1)(5)(6)（特定同族会社の留保金額に加算される特別税率 10/15/20%・留保控除額・月数按分）↔ CorporateSurtax.lean (specialSurtax, retentionMinDeduction, incomeFortyPct, prorated)",
           "340AC0000000034",
           "article", "第六十七条",
           ["年三千万円以下の金額百分の十", "年三千万円を超え、年一億円以下の金額百分の十五", "一億円を超える金額百分の二十",
            "二年二千万円", "の百分の四十に相当する金額",
            "三千万円を十二で除し、これに当該事業年度の月数を乗じて計算した金額",
            "一億円を十二で除し、これに当該事業年度の月数を乗じて計算した金額",
            "「二千万円を十二で除し、これに当該事業年度の月数を乗じて計算した金額」とする"])

    # 相続税法 art. 18 — InheritanceSurcharge.lean (相続税額の加算 百分の二十)
    yield ("相続税法 art. 18(1)（相続税額の加算・百分の二十）↔ InheritanceSurcharge.lean (surcharge20, inheritanceSurcharge)",
           "325AC0000000073",
           "article", "第十八条",
           ["その百分の二十に相当する金額を加算した金額とする"])

    # 国税通則法 art. 118 — TaxRounding.lean (thousandYenFloor)
    yield ("国税通則法 art. 118(1)（課税標準の端数計算等・千円未満切り捨て）↔ TaxRounding.lean (thousandYenFloor)",
           "337AC0000000066",
           "article", "第百十八条",
           ["その額に千円未満の端数があるとき、又はその全額が千円未満であるときは、その端数金額又はその全額を切り捨てる"])

    # 国税通則法 art. 119 — TaxRounding.lean (hundredYenFloor)
    yield ("国税通則法 art. 119(1)（確定金額の端数計算等・百円未満切り捨て）↔ TaxRounding.lean (hundredYenFloor)",
           "337AC0000000066",
           "article", "第百十九条",
           ["確定金額に百円未満の端数があるとき、又はその全額が百円未満であるときは、その端数金額又はその全額を切り捨てる"])

    # 相続税法 art. 15 — InheritanceTax.lean (inheritanceBasicDeduction 3,000万 + 600万 × heirs)
    yield ("相続税法 art. 15(1)（遺産に係る基礎控除：三千万円と六百万円に相続人の数を乗じた金額との合計額）↔ InheritanceTax.lean (inheritanceBasicDeduction)",
           "325AC0000000073",
           "article", "第十五条",
           ["三千万円と六百万円に当該被相続人の相続人の数を乗じて算出した金額との合計額"])

    # 相続税法 art. 16 — InheritanceTax.lean (inheritanceRateTable)
    yield ("相続税法 art. 16（相続税の総額における速算表・10%/15%/20%/30%/40%/45%/50%, 上限55%）↔ InheritanceTax.lean (inheritanceRateTable, inheritanceTopRate)",
           "325AC0000000073",
           "article", "第十六条",
           ["千万円以下の金額百分の十", "千万円を超え三千万円以下の金額百分の十五",
            "五千万円を超え一億円以下の金額百分の三十", "六億円を超える金額百分の五十五"])

    # 相続税法 art. 19 — GiftAddBack.lean (giftAddBack: 7年以内贈与加算, 100万円控除)
    yield ("相続税法 art. 19(1)（相続開始前七年以内の贈与加算・三年超の部分は百万円控除）↔ GiftAddBack.lean (giftAddBack)",
           "325AC0000000073",
           "article", "第十九条",
           ["相続の開始前七年以内に当該相続に係る被相続人から贈与により財産を取得したことがある場合",
            "当該財産の価額の合計額から百万円を控除した残額",
            "相続の開始前三年以内に取得した財産以外の財産にあつては"])

    # 相続税法 art. 20 — InheritanceSuccessiveDeduction.lean (successiveRate1/2/3)
    yield ("相続税法 art. 20（相次相続控除）↔ InheritanceSuccessiveDeduction.lean (successiveRate1/2/3)",
           "325AC0000000073",
           "article", "第二十条",
           ["開始前十年以内に開始した相続", "百分の百を超える場合には、百分の百の割合",
            "これを一年とする"])

    # 相続税法 art. 21-6 — SpousalGiftDeduction.lean (spousalDeduction 二千万円 cap)
    yield ("相続税法 art. 21-6(1)（贈与税の配偶者控除・二千万円上限）↔ SpousalGiftDeduction.lean (spousalDeduction)",
           "325AC0000000073",
           "article", "第二十一条の六",
           ["課税価格から二千万円", "婚姻期間が二十年以上"])

    # 印紙税法 art. 20 — StampDuty.lean (stampAuditPenalty 3x, stampDeclaredPenalty +10%, floor ¥1,000)
    yield ("印紙税法 art. 20（印紙納付に係る過怠税）↔ StampDuty.lean (stampAuditPenalty/stampDeclaredPenalty/stampDutyFloor)",
           "342AC0000000023",
           "article", "第二十条",
           ["その二倍に相当する金額との合計額", "百分の十の割合を乗じて計算した金額",
            "過怠税の合計額が千円に満たないときは、これを千円とする",
            "第二項の規定の適用を受けた過怠税のみに係る合計額であるときは、当該過怠税の合計額については、前項の規定の適用はない",
            "当該消されていない印紙の額面金額に相当する金額の過怠税"])

    # 登録免許税法 別表第一（一） — RegistrationTax.lean (realEstateMilleRate)
    yield ("登録免許税法 別表第一（一）（不動産の登記）↔ RegistrationTax.lean (realEstateMilleRate)",
           "342AC0000000035",
           "file", None,
           ["所有権の保存の登記不動産の価額千分の四",
            "共有物の分割による移転の登記不動産の価額千分の四",
            "相続又は法人の合併による移転の登記不動産の価額千分の四",
            "その他の原因による移転の登記不動産の価額千分の二十",
            "設定又は転貸の登記不動産の価額千分の十",
            "相続又は法人の合併による移転の登記不動産の価額千分の二",
            "共有に係る権利の分割による移転の登記不動産の価額千分の二",
            "その他の原因による移転の登記不動産の価額千分の十",
            "配偶者居住権の設定の登記不動産の価額千分の二",
            "債権金額、極度金額又は不動産工事費用の予算金額千分の四",
            "相続又は法人の合併による移転の登記債権金額又は極度金額千分の一",
            "その他の原因による移転の登記債権金額又は極度金額千分の二",
            "所有権の信託の登記不動産の価額千分の四",
            "先取特権、質権又は抵当権の信託の登記債権金額又は極度金額千分の二",
            "その他の権利の信託の登記不動産の価額千分の二"])

    # 登録免許税法 別表第一（二）第二十四号（一）イ〜ヨ — RegistrationCommercialTax.lean (stockFormationRate...) + RegistrationCommercialTaxTable.lean (イ〜ヨ 全帯)
    yield ("登録免許税法 別表第一（二）第二十四号（一）イ〜ヨ（株式会社等の設立・資本金増加・各種の登記）↔ RegistrationCommercialTax.lean + RegistrationCommercialTaxTable.lean",
           "342AC0000000035",
           "file", None,
           ["イ　株式会社の設立の登記（ホ及びトに掲げる登記を除く。）資本金の額千分の七",
            "ロ　合名会社若しくは合資会社又は一般社団法人等の設立の登記申請件数一件につき六万円",
            "ハ　合同会社の設立の登記（ホ及びトに掲げる登記を除く。）資本金の額千分の七",
            "ニ　株式会社又は合同会社の資本金の増加の登記（ヘ及びチに掲げる登記を除く。）増加した資本金の額千分の七",
            "ホ　新設合併又は組織変更若しくは種類の変更による株式会社又は合同会社の設立の登記資本金の額千分の一・五",
            "ヘ　吸収合併による株式会社又は合同会社の資本金の増加の登記増加した資本金の額千分の一・五",
            "ト　新設分割による株式会社又は合同会社の設立の登記資本金の額千分の七",
            "チ　吸収分割による株式会社又は合同会社の資本金の増加の登記増加した資本金の額千分の七",
            "　相互会社の設立（新設合併又は組織変更による設立を含む。）の登記申請件数一件につき三十万円",
            "　新株予約権の発行による変更の登記申請件数一件につき九万円",
            "　支店又は従たる事務所の設置の登記支店又は従たる事務所の数一箇所につき六万円",
            "　本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記本店若しくは主たる事務所又は支店若しくは従たる事務所の数一箇所につき三万円",
            "　取締役会、監査役会、監査等委員会若しくは指名委員会等（会社法第二条第十二号（定義）に規定する指名委員会等をいう。以下（一）において同じ。）又は理事会に関する事項の変更の登記申請件数一件につき三万円",
            "　取締役、代表取締役若しくは特別取締役、会計参与、監査役、会計監査人、指名委員会等の委員、執行役若しくは代表執行役若しくは社員又は理事、監事、代表理事若しくは評議員に関する事項の変更（会社又は相互会社若しくは一般社団法人等の代表に関する事項の変更を含む。）の登記申請件数一件につき三万円",
            "（資本金の額が一億円以下の会社又は一般社団法人等については、一万円）",
            "　支配人の選任の登記又はその代理権の消滅の登記申請件数一件につき三万円",
            "　取締役、代表取締役若しくは特別取締役、会計参与、監査役若しくは指名委員会等の委員、執行役若しくは代表執行役の職務執行の停止若しくは職務代行者の選任、社員の業務執行権の消滅、職務執行の停止若しくは職務代行者の選任又は理事、監事、代表理事若しくは評議員の職務執行の停止若しくは職務代行者の選任の登記申請件数一件につき三万円",
            "　会社又は相互会社若しくは一般社団法人等の解散の登記申請件数一件につき三万円",
            "　会社若しくは一般社団法人等の継続の登記、合併を無効とする判決が確定した場合における合併により消滅した会社若しくは相互会社若しくは一般社団法人等の回復の登記又は会社若しくは相互会社若しくは一般社団法人等の設立の無効若しくはその設立の取消しの登記申請件数一件につき三万円",
            "　登記事項の変更、消滅又は廃止の登記（これらの登記のうちイからソまでに掲げるものを除く。）申請件数一件につき三万円",
            "　登記の更正の登記申請件数一件につき二万円",
            "　登記の抹消申請件数一件につき二万円",
            "　営業所の設置の登記（ロに掲げる登記を除く。）営業所の数一箇所につき九万円",
            "　営業所を設置していない場合の外国会社の登記又は当該営業所を設置していない外国会社が初めて設置する一の営業所の設置の登記申請件数一件につき六万円",
            "　イ、ロ及びニに掲げる登記以外の登記申請件数一件につき九千円",
            "　登記の更正の登記又は登記の抹消申請件数一件につき六千円",
            "　清算人又は代表清算人の登記申請件数一件につき九千円",
            "　清算人若しくは代表清算人の職務執行の停止若しくはその取消し若しくは変更又は清算人若しくは代表清算人の職務代行者の選任、解任若しくは変更の登記申請件数一件につき六千円",
            "　清算の結了の登記申請件数一件につき二千円",
            "　登記事項の変更、消滅若しくは廃止の登記（これらの登記のうちロに掲げるものを除く。）、登記の更正の登記又は登記の抹消申請件数一件につき六千円",
            "　特定目的会社の登記（一）　資産の流動化に関する法律（平成十年法律第百五号）第二条第三項（定義）に規定する特定目的会社の設立の登記申請件数一件につき三万円",
            "　投資法人の登記（一）　投資信託及び投資法人に関する法律（昭和二十六年法律第百九十八号）第二条第十二項（定義）に規定する投資法人の設立の登記申請件数一件につき三万円",
            "（二）　（一）及び（三）に掲げる登記以外の登記申請件数一件につき一万五千円",
            "（三）　登記の抹消申請件数一件につき一万円",
            "　有限責任事業組合契約の登記（一）　",
            "　組合契約の効力の発生の登記申請件数一件につき六万円",
            "　従たる事務所の設置の登記申請件数一件につき六万円",
            "　主たる事務所又は従たる事務所の移転の登記申請件数一件につき三万円",
            "　組合員に関する事項の変更の登記申請件数一件につき一万円",
            "　組合員の業務執行の停止又は業務代行者の選任の登記申請件数一件につき三万円",
            "　イからホまで、ト及びチに掲げる登記以外の登記申請件数一件につき三万円",
            "　登記の更正の登記申請件数一件につき二万円",
            "　登記の抹消申請件数一件につき二万円",
            "　清算人の登記申請件数一件につき六千円",
            "　イ、ハ及びニに掲げる登記以外の登記申請件数一件につき六千円",
            "　清算結了の登記申請件数一件につき二千円",
            "　投資事業有限責任組合契約の登記（一）　投資事業有限責任組合契約に関する法律（平成十年法律第九十号）第三条第一項（投資事業有限責任組合契約）に規定する投資事業有限責任組合契約",
            "　組合契約の効力の発生の登記申請件数一件につき三万円",
            "　イ、ハ及びニに掲げる登記以外の登記申請件数一件につき一万五千円",
            "　限定責任信託の登記（一）　信託法（平成十八年法律第百八号）第二百三十二条（限定責任信託の定めの登記）の限定責任信託の定めの登記申請件数一件につき三万円",
            "　信託法第二百三十三条第一項（変更の登記）の規定による新事務処理地においてする同法第二百三十二条各号に掲げる事項の登記申請件数一件につき一万五千円",
            "（一）、（二）及び（四）から（六）までに掲げる登記以外の登記申請件数一件につき一万五千円",
            "（六）ニに掲げる登記を除く。）申請件数一件につき一万円",
            "　清算受託者の登記申請件数一件につき六千円"])

    # 地方税法 art. 34 — LocalIncomeTax.lean (basicDeduction, spouseDeduction, disabilityDeduction, widowDeduction, singleParentDeduction, medicalExpenseDeduction, specificDependentDeduction)
    yield ("地方税法 art. 34(2)/(1)二号/六号/八号/八の二/十号/十二号（道府県民税 基礎控除・医療費控除・障害者控除・寡婦控除・ひとり親控除・配偶者控除・特定親族特別控除）↔ LocalIncomeTax.lean",
           "325AC0000000226",
           "article", "第三十四条",
           ["合計所得金額が二千四百万円以下である場合四十三万円",
            "合計所得金額が二千四百万円を超え二千四百五十万円以下である場合二十九万円",
            "合計所得金額が二千四百五十万円を超え二千五百万円以下である場合十五万円",
            "その金額が十万円を超える場合には、十万円",
            "その金額が二百万円を超える場合には、二百万円",
            "六障害者である所得割の納税義務者又は障害者である同一生計配偶者若しくは扶養親族を有する所得割の納税義務者各障害者につき二十六万円（その者が特別障害者（障害者のうち、精神又は身体に重度の障害がある者で政令で定めるものをいう。第三項及び第八項並びに第三十七条において同じ。）である場合には、三十万円）",
            "三十万円）七削除八寡婦である所得割の納税義務者二十六万円八の二ひとり親である所得割の納税義務者三十万円",
            "当該納税義務者の前年の合計所得金額が九百万円以下である場合三十三万円",
            "（その控除対象配偶者が老人控除対象配偶者",
            "合計所得金額が九百万円を超え九百五十万円以下である場合当該配偶者のイ（１）から（３）までに掲げる区分に応じ、それぞれイ（１）から（３）までに定める金額の三分の二に相当する金額",
            "合計所得金額が九百五十万円を超え千万円以下である場合当該配偶者のイ（１）から（３）までに掲げる区分に応じ、それぞれイ（１）から（３）までに定める金額の三分の一に相当する金額",
            "当該特別障害者に係る第一項第六号の金額は、五十三万円とする",
            "イ前年の合計所得金額が九十五万円以下である特定親族四十五万円",
            "八十四万一円を超える部分の金額に二を乗じた金額",
            "ハ前年の合計所得金額が百十五万円を超え百二十万円以下である特定親族六万円",
            "ニ前年の合計所得金額が百二十万円を超える特定親族三万円"])

    # 相続税法 art. 19-3/19-4 — InheritanceMinorDisabledDeduction.lean (minorDeduction, disabledDeduction, yearsCeil)
    yield ("相続税法 art. 19-3/19-4（未成年者控除（十万円 × 18歳達年数）／障害者控除（十万円／特別障害者二十万円 × 85歳達年数）、一年未満・端数は一年とする）↔ InheritanceMinorDisabledDeduction.lean (minorDeduction, disabledDeduction, yearsCeil)",
           "325AC0000000073",
           "file", None,
           ["十万円にその者が十八歳に達するまでの年数",
            "十万円（その者が特別障害者である場合には、二十万円）にその者が八十五歳に達するまでの年数"])

    # 地方税法 art. 314の3 — LocalInhabitantTax.lean (6% / 8% 指定都市)
    yield ("地方税法 art. 314の3（市町村民税 所得割の税率・百分の六／指定都市の区域内住所者百分の八）↔ LocalInhabitantTax.lean (localInhabitantStandardRate)",
           "325AC0000000226",
           "article", "第三百十四条の三",
           ["百分の六（所得割の納税義務者が地方自治法第二百五十二条の十九第一項の市（第三百十四条の六及び第三百十四条の七において「指定都市」という。）の区域内に住所を有する場合には、百分の八）"])

    # 消費税法 art. 29 — ConsumptionTaxRate.lean (standardRate 7.8% / reducedRate 6.24%)
    yield ("消費税法 art. 29（税率: 百分の七・八／軽減対象課税資産の譲渡等及び保税地域から引き取られる軽減対象課税貨物 百分の六・二四）↔ ConsumptionTaxRate.lean (standardRate 78/1000, reducedRate 624/10000)",
           "363AC0000000108",
           "article", "第二十九条",
           ["百分の七・八", "百分の六・二四"])

    # 地方税法 art. 35 — LocalIncomeTax.lean (4% / 2% 指定都市)
    yield ("地方税法 art. 35（道府県民税 所得割の税率・百分の四／指定都市の区域内住所者百分の二）↔ LocalIncomeTax.lean (localIncomeStandardRate)",
           "325AC0000000226",
           "article", "第三十五条",
           ["百分の四（所得割の納税義務者が地方自治法第二百五十二条の十九第一項の市（第三十七条及び第三十七条の二において「指定都市」という。）の区域内に住所を有する場合には、百分の二）"])


def main() -> int:
    sys.stdout.reconfigure(encoding="utf-8")
    NOT_YET_COVERED = [
        "LocalIncomeTax.lean art. 34 のその他の控除（生命保険料控除・地震保険料控除）の literal（医療費控除・障害者控除・寡婦控除・ひとり親控除・配偶者控除・基礎控除・特定親族特別控除は covered）",
        "LocalExemption.lean / LocalPrivilege.lean / LocalObligor.lean（賦課方式の税額算定 literal なし／定義分類器）",
        "KanzeiGoods.lean（関税法 art. 2 の物品定義分類器・税率 literal なし／cross_law の pin のみ）",
        "RegistrationTax.lean の未採用帯域（仮登記・分離の登記等）の literal のうち未検査のもの",
        "RegistrationCommercialTaxTable.lean の未採用帯域（二十九：個人の商業登記〜以降： 船舶管理人／夫婦財産契約等の非会社登記 数百点／三十二〜百六十： 資格者登記等 数百点 など）",
        "ConsumptionTaxRate.lean の次のアンカー外（art. 29(2)／art. 28 課税標準・art. 30 仕入税額控除 等）— モデル未採用かつ未検査",
        "InheritanceSurcharge.lean art. 17 の相続税額算出（相続税法 art. 17 には literal がない・割合計算のみ。InheritanceApportionment.lean としてモデル化済み・literal 監査対象外）",
        "ListedDividendWithholding.lean の art. 9の3の二(1) 第一号〜六号 のカテゴリ定義・基准日の政令規定／第三項各号の暫定外国税按分計算（art. 9の3 の 15% 読み替えパスと合わせて非モデル化・caller-established）",
        "StampDuty.art. 20 の集計・floor にまつわる全 detail（文言は covered・ロジックは未検査）",
        "CounterexampleSweep-covered impls (already subject to L6, not pinned-literal audit)",
        "all L3 actor/definition modules (no rate/amount literals to transcribe)",
    ]

    failures = []
    passed = 0
    total = 0
    for name, law_id, kind, title, needles in checks():
        total += 1
        if kind == "article":
            haystack = find_article_text(law_id, title)
            if haystack is None:
                failures.append(f"{name}: article {title} NOT FOUND in pinned law {law_id}")
                continue
        else:
            haystack = load_law_text(law_id)
        missing = [n for n in needles if not contains(haystack, n)]
        if missing:
            failures.append(f"{name}: missing {len(missing)}/{len(needles)} anchor(s): {missing}")
        else:
            passed += 1
            print(f"PASS  {name}")
    print()
    print(f"transcription audit: {passed}/{total} checks passed")
    print("(transcription fidelity only — NOT a semantics audit, NOT legal correctness)")
    print()
    print("NOT YET COVERED by this audit (transcription unverified, treat accordingly):")
    for name in NOT_YET_COVERED:
        print(f"  - {name}")
    if failures:
        print()
        for f in failures:
            print("FAIL", f)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
