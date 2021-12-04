select "nomRecette"
    from "Recettes"
     WHERE "idRecette" in
           (select "idRecette"
                from "Planning_Recettes_Utilisateurs"
                    having count("idRecette")=(
                        select max(count("idRecette"))
                            from "Planning_Recettes_Utilisateurs"
                               group by "idRecette"
            )
            group by "idRecette");