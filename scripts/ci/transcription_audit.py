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
    yield ("法人税法 art. 67(1)（特定同族会社の留保金額に加算される特別税率 10/15/20%）↔ CorporateSurtax.lean (specialSurtax)",
           "340AC0000000034",
           "article", "第六十七条",
           ["年三千万円以下の金額百分の十", "年三千万円を超え、年一億円以下の金額百分の十五", "一億円を超える金額百分の二十"])

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

    # 地方税法 art. 314の3 — LocalInhabitantTax.lean (6% / 8% 指定都市)
    yield ("地方税法 art. 314の3（市町村民税 所得割の税率・百分の六／指定都市の区域内住所者百分の八）↔ LocalInhabitantTax.lean (localInhabitantStandardRate)",
           "325AC0000000226",
           "article", "第三百十四条の三",
           ["百分の六（所得割の納税義務者が地方自治法第二百五十二条の十九第一項の市（第三百十四条の六及び第三百十四条の七において「指定都市」という。）の区域内に住所を有する場合には、百分の八）"])

    # 地方税法 art. 35 — LocalIncomeTax.lean (4% / 2% 指定都市)
    yield ("地方税法 art. 35（道府県民税 所得割の税率・百分の四／指定都市の区域内住所者百分の二）↔ LocalIncomeTax.lean (localIncomeStandardRate)",
           "325AC0000000226",
           "article", "第三十五条",
           ["百分の四（所得割の納税義務者が地方自治法第二百五十二条の十九第一項の市（第三十七条及び第三十七条の二において「指定都市」という。）の区域内に住所を有する場合には、百分の二）"])


def main() -> int:
    sys.stdout.reconfigure(encoding="utf-8")
    NOT_YET_COVERED = [
        "GiftAddBack.lean", "SpousalGiftDeduction.lean", "InheritanceSuccessiveDeduction.lean",
        "InheritanceTax.lean", "StampDuty.lean", "KanzeiGoods.lean", "RegistrationTax.lean",
        "RegistrationCommercialTax.lean", "LocalIncomeTax.lean art. 34(2)/(1)十号",
        "LocalExemption.lean", "LocalPrivilege.lean", "LocalObligor.lean",
        "CorporateSurtax.lean art. 67(5) 留保控除額（2,000万円）等の残りの literal",
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
