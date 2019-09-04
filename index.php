<?php

$pdo = new PDO('mysql:host=localhost;dbname=cv', 'root', '');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Resume</title>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>

<body>
    <!-- NAVIGATION START -->
    <nav class="nav">
        <div class="colapse navbar-colapse">
            <button id="about_btn" class="nav-btn" onclick="click_about()">
                <i class="fas fa-user"></i>
                <strong>ABOUT ME</strong>
            </button>
            <button id="projects_btn" class="nav-btn" onclick="click_projects()">
                <i class="fas fa-pencil-alt"></i>
                <strong>PROJECTS</strong>
            </button>
            <button id="background_btn" class="nav-btn" onclick="click_background()">
                <i class="fas fa-list-alt"></i>
                <strong>BACKGROUND</strong>
            </button>
        </div>
    </nav>
    <!-- NAVIGATION END -->

    <!-- CONTENT START -->
    <div class="container">
        <div class="row">

            <!-- SHORT CART START -->
            <div class="col-md-3 column">
                <h4>Short Information</h4>
                <img src="img/pic.jpg" alt="Photo Of Me" width="100%">
                <div class="short_information">
                    <?php
                    $queryPersonalInfo = '
                        SELECT 
                            `personal_info`.`id`, 
                            `personal_info`.`key`, 
                            `personal_info`.`value`, 
                            `personal_info`.`term`, 
                            `info_types`.`name` 
                        FROM 
                            `personal_info`
                        INNER JOIN 
                            `info_types`
                        ON
                            `personal_info`.`type` = `info_types`.`id`
                        WHERE
                            `info_types`.`name` = ?
                    ';

                    $stmt = $pdo->prepare($queryPersonalInfo);
                    $stmt->execute(['Bio']);
                    $bioInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    
                    foreach($bioInfo as $currentInfo): ?> 
                    
                        <div class="row">
                            <div class="col-md-3">
                                <strong><?= $currentInfo['key'] ?></strong>
                            </div>
                            <div class="col-md-9">
                                <?= $currentInfo['value'] ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
            <!-- SHORT CART END -->

            <div class="col-md-1">

            </div>

            <!-- ADDITIONAL INFO START -->
            <div id="about_content" class="col-md-8 column">

                <!-- SKILLS WITH PROGRESS BARS START -->
                <h3>Skills</h3>
                <hr>
                <?php
                    $queryExperience = "
                        SELECT
                            `experience`.`id`,
                            `experience`.`key`,
                            `experience`.`value`,
                            `experience`.`term`
                        FROM
                            `experience`
                        INNER JOIN
                            `experience_types`
                        ON
                            `experience`.`experience_type` = `experience_types`.`id`
                        WHERE
                            `experience_types`.`name` = ?
                    ";

                    $stmt = $pdo->prepare($queryExperience);
                    $stmt->execute(['Skills']);
                    $skillsInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach($skillsInfo as $currentSkill):
                ?>

                    <div class="row">
                        <div class="col-md-2">
                            <strong><?= $currentSkill['key'] ?></strong>
                        </div>
                        <div class="col-md-10">
                            <div class="progress-bar">
                                <div class="completed-progress-bar" style="width: <?= $currentSkill['value'] ?>"></div>
                            </div>
                        </div>
                    </div>

                <?php endforeach; ?> 
                <!-- SKILLS WITH PROGRESS BAR END -->
            </div>
            <!-- ABOUT CONTENT END -->

            <!-- PROJECTS CONTENT START -->
            <div id="projects_content" class="col-md-8 column">
                
                <h3><strong>PROJECTS I HAVE WORKED ON</strong></h3>
                <hr>
                <br />

                <?php
                    $stmt = $pdo->prepare($queryExperience);
                    $stmt->execute(['Projects']);
                    $projectsInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    
                    foreach($projectsInfo as $currentProject):
                ?>

                    <h5>
                        <div class="title">
                            <?= $currentProject['key'] ?>
                        </div>
                    </h5>
                    <p>
                        <?= $currentProject['value'] ?>
                    </p>
                <?php endforeach; ?>
            </div>
            <!-- PROJECTS CONTENT END -->

            <!-- BACKGROUND CONTENT START -->
            <div id="background_content" class="col-md-8 column">
                <h3>
                    <strong>
                        PROFESSIONAL EXPERIENCE
                    </strong>
                </h3>
                <hr>
                <br />
                <!-- Professional Experience Description START -->
                <?php
                    $stmt = $pdo->prepare($queryExperience);
                    $stmt->execute(['Professional Experience']);
                    $professionalExperienceInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach($professionalExperienceInfo as $currentProfessionalExperienceInfo):
                ?>

                <div class="row">
                    <div class="col-md-3">
                        <strong>
                            <?= $currentProfessionalExperienceInfo['term'] ?>
                        </strong>
                    </div>
                    <div class="col-md-9">
                        <strong>
                            <?= $currentProfessionalExperienceInfo['key'] ?>
                        </strong>
                        <br /> 
                        <?= $currentProfessionalExperienceInfo['value'] ?>
                    </div> 
                </div>
                <br /><br />
                <?php endforeach; ?>
                
                <br />
                <br />
                <!-- Professional Experience Description END -->

                <h3>
                    <strong>
                        EDUCATIONAL BACKGROUND
                    </strong>
                </h3>
                <hr>
                <br />
                <?php 
                    $stmt = $pdo->prepare($queryPersonalInfo);
                    $stmt->execute(['Education']);
                    $educationInfo = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach ($educationInfo as $currentEdicationInfo):
                ?>

                <div class="row">
                    <div class="col-md-3">
                        <strong>
                            <?= $currentEdicationInfo['term'] ?>
                        </strong>
                    </div>
                    <div class="col-md-9">
                        <strong>
                            <?= $currentEdicationInfo['key'] ?>
                            <br />
                            <?= $currentEdicationInfo['value'] ?> 
                        </strong>
                    </div>
                </div>
                <br />
                <br />

                <?php endforeach; ?>
                
            <!-- BACKGROUND CONTENT END -->

            <!-- ADDITIONAL INFO END -->
        </div>
    </div>

    <!-- CONTENT END -->

    <script src="js/bootstrap/bootstrap.js"></script>
    <script src="js/dateCalculator.js"></script>
    <script src="js/main.js"></script>
</body>

</html>