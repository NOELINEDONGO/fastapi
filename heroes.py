from typing import List
from classes import Hero
import csv

HEROES: List[Hero] = [
    Hero(
        id=1,
        nick_name="DONGO",
        full_name="NONO DONGO",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    ),
    Hero(
        id=2,
        nick_name="DONGO",
        full_name="NONO",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    ),
    Hero(
        id=3,
        nick_name="KOFFI",
        full_name="NONO",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    ),
    Hero(
        id=4,
        nick_name="KOUMA",
        full_name="EMMA",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    ),
    Hero(
        id=5,
        nick_name="KOUADIO",
        full_name="JEAN",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    ),
    Hero(
        id=6,
        nick_name="YAO",
        full_name="JOSEE",
        occupation=["wizard", "Adventurer", "Deity"],
        powers=["Magical promess", "High intelligence", "Charisma"],
        hobby=["Studying magic", "Drinking", "Cooking"],
        type="wizard",
        rank=54
    )
]


# CREATE A CSV FILE FROM THE ABOVE
def format_array(py_list):
    return '{' + ', '.join(f' "{item}"' for item in py_list) + '}'


with open("heroes.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    # HEADERS
    writer.writerow(["nick_name", "full_name", "occupation", "powers", "hobby", "type", "rank"])
    # DATA
    for hero in HEROES:
        writer.writerow([hero.nick_name, hero.full_name, format_array(hero.occupation), format_array(hero.powers),
                         format_array(hero.hobby), hero.type, hero.rank])
