<?php

namespace App\DataFixtures;

use App\Entity\Produits;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i=0; $i < 20; $i++) { 
            $produits = new Produits();
            if ($i % 2 === 0) {
                $produits->setType('Chaussure') ;
                $produits->setImage('https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026');
            }
            else{
                $produits->setType('Vétement');
                $produits->setImage('https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg');
            }
            $produits->setName('produit'.$i);
            $produits->setModele('modele'.$i);
            $produits->setPrix(rand(1, 200000)/100);
            $produits->setStock(rand(0,20));

            $manager->persist($produits);
        }

        $manager->flush();
    }
}
