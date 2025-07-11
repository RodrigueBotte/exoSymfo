<?php

namespace App\Controller;

use App\Entity\Produits;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        
        return $this->render('home/home.html.twig', [
            'controller_name' => 'HomeController',
            
        ]);
    }
}
