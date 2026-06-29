$filePath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

$startMarker = '<section class="why-choose section-padding bg-darker">'
$endMarker = '<section class="author section-padding bg-darker">'

$startIndex = $content.IndexOf($startMarker)
$endIndex = $content.IndexOf($endMarker)

if ($startIndex -eq -1 -or $endIndex -eq -1) {
    Write-Host "Markers not found!"
    Write-Host "Start found: $($startIndex -ne -1)"
    Write-Host "End found: $($endIndex -ne -1)"
    exit 1
}

$newSections = @"
    <section class="why-choose section-padding bg-darker">
        <div class="container">
            <div class="section-header">
                <h2>Por Que Escolher Nossos Moldes?</h2>
                <p>Qualidade Profissional Garantida</p>
            </div>

            <!-- Scanner Animation Container -->
            <div class="scanner-wrapper reveal">
                <div class="scanner-container">
                    <img src="scanner_blueprint_new.jpg" alt="Blueprint Katana" class="scanner-image">
                    <div class="scanner-overlay"></div>
                    <div class="scanner-laser"></div>
                    <div class="scanner-particles"></div>
                    <div class="scanner-hud">
                        <div class="hud-item item-1">
                            <span class="hud-label">Steel Composition</span>
                            <span class="hud-value">1095</span>
                        </div>
                        <div class="hud-item item-2">
                            <span class="hud-label">Sharpness Index</span>
                            <span class="hud-value">94%</span>
                        </div>
                        <div class="hud-item item-3">
                            <span class="hud-label">Curvature Accuracy</span>
                            <span class="hud-value">98%</span>
                        </div>
                        <div class="hud-item item-4">
                            <span class="hud-label">Structural Integrity</span>
                            <span class="hud-value">91%</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="benefits-list">
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="ruler" class="icon-gold"></i>
                    <p>Precisão baseada em padrões europeus de alta qualidade</p>
                </div>
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="clock" class="icon-gold"></i>
                    <p>Economize meses de tentativa e erro no desenvolvimento de designs</p>
                </div>
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="layers" class="icon-gold"></i>
                    <p>Variedade completa para atender qualquer estilo de faca</p>
                </div>
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="check-circle-2" class="icon-gold"></i>
                    <p>Moldes testados e aprovados por cuteleiros profissionais</p>
                </div>
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="settings" class="icon-gold"></i>
                    <p>Formatos universais compatíveis com qualquer método de produção</p>
                </div>
                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="headphones" class="icon-gold"></i>
                    <p>Suporte técnico para tirar todas as suas dúvidas</p>
                </div>
            </div>

            <!-- TIMELINE DA CUTELARIA -->
            <div class="timeline-section reveal">
                <div class="timeline-header">
                    <h3>Linha do Tempo da Cutelaria</h3>
                </div>
                <div class="timeline-container">
                    <!-- 500 a.C -->
                    <div class="timeline-item reveal">
                        <div class="timeline-marker"></div>
                        <div class="timeline-content">
                            <span class="timeline-year">500 a.C</span>
                            <h4>As Primeiras Lâminas</h4>
                            <p>Desenhos rústicos, pedra lascada, início da metalurgia. O nascimento da ferramenta mais importante da humanidade.</p>
                        </div>
                    </div>

                    <!-- Idade Média -->
                    <div class="timeline-item reveal">
                        <div class="timeline-marker"></div>
                        <div class="timeline-content">
                            <span class="timeline-year">IDADE MÉDIA</span>
                            <h4>Espadas Europeias</h4>
                            <p>Forja tradicional, lâminas longas, ornamentação clássica. A era onde a arte encontrou a guerra.</p>
                        </div>
                    </div>

                    <!-- 1800 -->
                    <div class="timeline-item reveal">
                        <div class="timeline-marker"></div>
                        <div class="timeline-content">
                            <span class="timeline-year">1800</span>
                            <h4>Facas de Trabalho</h4>
                            <p>Ferramentas robustas, cutelaria funcional do período industrial. Aço carbono e durabilidade extrema.</p>
                        </div>
                    </div>

                    <!-- Hoje -->
                    <div class="timeline-item reveal">
                        <div class="timeline-marker"></div>
                        <div class="timeline-content">
                            <span class="timeline-year">HOJE</span>
                            <h4>Cutelaria Moderna</h4>
                            <p>Design técnico, curvas otimizadas, precisão milimétrica. A fusão perfeita entre tecnologia e tradição.</p>
                        </div>
                    </div>
                </div>

                <div class="timeline-conclusion reveal">
                    <h3>Agora você tem acesso aos <strong>300 moldes</strong> inspirados em toda essa evolução.</h3>
                </div>
            </div>

            <!-- Bonus 1 -->
            <div class="bonus-book-container reveal">
                <div class="book">
                    <div class="front">
                        <div class="cover-content">
                            <h3>BÔNUS #1</h3>
                            <p class="bonus-title">Guia de Técnicas</p>
                            <p class="bonus-value">R$47</p>
                        </div>
                    </div>
                    <div class="back"></div>
                    <div class="left"></div>
                </div>
                <div class="book-shadow"></div>
            </div>

            <!-- Bonus 2 -->
            <div class="bonus-book-container reveal">
                <div class="book">
                    <div class="front">
                        <div class="cover-content">
                            <h3>BÔNUS #2</h3>
                            <p class="bonus-title">50 Modelos premium exclusivos</p>
                            <p class="bonus-value">R$37</p>
                        </div>
                    </div>
                    <div class="back"></div>
                    <div class="left"></div>
                </div>
                <div class="book-shadow"></div>
            </div>

            <!-- Bonus 3 -->
            <div class="bonus-book-container reveal">
                <div class="book">
                    <div class="front">
                        <div class="cover-content">
                            <h3>BÔNUS #3</h3>
                            <p class="bonus-title">Grupo VIP</p>
                            <p class="bonus-value">R$97</p>
                        </div>
                    </div>
                    <div class="back"></div>
                    <div class="left"></div>
                </div>
                <div class="book-shadow"></div>
            </div>

            <!-- Bonus 4 -->
            <div class="bonus-book-container reveal">
                <div class="book">
                    <div class="front">
                        <div class="cover-content">
                            <h3>BÔNUS #4</h3>
                            <p class="bonus-title">Lucrando 10k/mês</p>
                            <p class="bonus-value">R$197</p>
                        </div>
                    </div>
                    <div class="back"></div>
                    <div class="left"></div>
                </div>
                <div class="book-shadow"></div>
            </div>
            
            <div class="bonus-summary">
                <p>Total em Bônus: <span class="strike">R$378</span></p>
                <p class="free-highlight">HOJE: GRÁTIS</p>
            </div>
        </div>
    </section>

    <!-- SEÇÃO 5: CONTADOR E PLANOS -->
    <section id="pricing" class="pricing section-padding bg-darker">
        <div class="container">
            <div class="countdown-container">
                <h3>OFERTA LIMITADA - TERMINA EM:</h3>
                <div id="countdown" class="countdown-timer">
                    <!-- JS will populate this -->
                    15h : 35m : 25s
                </div>
                <p>Investimento único para elevar sua cutelaria ao próximo nível</p>
            </div>

            <div class="pricing-grid">
                <!-- Plano Básico -->
                <div class="pricing-card basic reveal">
                    <h4>Plano Básico</h4>
                    <p class="plan-desc">Para começar na cutelaria</p>
                    <div class="price">
                        <span class="old-price">R$ 49,99</span>
                        <span class="new-price">R$ 9,99</span>
                    </div>
                    <p class="payment-type">Pagamento único</p>
                    <ul class="plan-features">
                        <li>100 moldes profissionais</li>
                        <li>Acesso por 30 dias</li>
                        <li>Formatos PDF e DWG</li>
                        <li>Suporte por email</li>
                    </ul>
                    <a href="upsell.html" class="cta-button primary pulse reveal">QUERO O BÁSICO</a>
                    <p class="upsell-hint" style="margin-top: 15px; font-size: 0.9rem; color: #ccc; font-style: italic;">Mas antes de comprar... temos uma oferta AINDA MAIS vantajosa para você! Veja logo abaixo ⬇</p>
                </div>

                <!-- Plano Premium -->
                <div class="pricing-card premium reveal">
                    <div class="popular-badge">MAIS VENDIDO</div>
                    <h4>Plano Premium</h4>
                    <p class="plan-desc">Para quem quer dominar a cutelaria</p>
                    <div class="price">
                        <span class="old-price">R$ 97,00</span>
                        <span class="new-price">R$ 26,90</span>
                    </div>
                    <p class="payment-type">Pagamento único</p>
                    <ul class="plan-features">
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Os 300 moldes profissionais completos</li>
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Acesso vitalício</li>
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Atualizações mensais (novos moldes todo mês)</li>
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Arquivos editáveis: PDF, DWG, AI, SVG, DXF, Corel, Fusion</li>
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Ebook extra “Dominando moldes para facas de defesa pessoal”</li>
                        <li><i data-lucide="check" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; color: var(--primary);"></i> Suporte prioritário</li>
                        <li class="bonus-item"><i data-lucide="gift" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px;"></i> Bônus #1: Guia de técnicas de cutelaria, 0 ao avançado</li>
                        <li class="bonus-item"><i data-lucide="gift" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px;"></i> Bônus #2: Biblioteca Secreta com 50 moldes extras</li>
                        <li class="bonus-item"><i data-lucide="gift" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px;"></i> Bônus #3: Acesso à Comunidade VIP de Cuteleiros</li>
                        <li class="bonus-item"><i data-lucide="gift" style="width: 16px; height: 16px; vertical-align: middle; margin-right: 8px;"></i> Bônus #4: Lucrando 10k por mês com cutelaria</li>
                    </ul>
                    <a href="https://pay.kiwify.com.br/4u00I7u" class="cta-button primary pulse reveal">GARANTIR O PREMIUM</a>
                </div>
            </div>
        </div>
    </section>

    <!-- SEÇÃO 6: DEPOIMENTOS -->
    <section class="testimonials section-padding">
        <div class="container">
            <div class="section-header">
                <h2>O Que Nossos Clientes Dizem</h2>
                <p>Histórias reais de quem transformou sua cutelaria</p>
            </div>
            <div class="grid-3">
                <div class="testimonial-card reveal">
                    <div class="user-info">
                        <img src="user_avatar_1.png" alt="Carlos Silva" class="avatar-img">
                        <div>
                            <h4>Carlos Silva</h4>
                            <p>Cuteleiro Profissional</p>
                        </div>
                    </div>
                    <div class="rating">
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                    </div>
                    <p>"Os moldes são de uma qualidade excepcional. Minha produção aumentou 300% desde que comecei a usar. Recomendo demais!"</p>
                </div>
                <div class="testimonial-card reveal">
                    <div class="user-info">
                        <img src="user_avatar_2.png" alt="Roberto Mendes" class="avatar-img">
                        <div>
                            <h4>Roberto Mendes</h4>
                            <p>Artesão de Facas</p>
                        </div>
                    </div>
                    <div class="rating">
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                    </div>
                    <p>"Finalmente encontrei moldes que seguem os padrões europeus. A precisão é impressionante e os bônus valem muito a pena."</p>
                </div>
                <div class="testimonial-card reveal">
                    <div class="user-info">
                        <img src="user_avatar_3.png" alt="André Costa" class="avatar-img">
                        <div>
                            <h4>André Costa</h4>
                            <p>Proprietário de Cutelaria</p>
                        </div>
                    </div>
                    <div class="rating">
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                        <i data-lucide="star" fill="currentColor" class="star-filled"></i>
                    </div>
                    <p>"Investimento que se pagou na primeira semana. A variedade de modelos permite atender qualquer cliente. Excelente!"</p>
                </div>
            </div>
        </div>
    </section>

    <!-- SEÇÃO 7: SOBRE O AUTOR -->
"@

$newContent = $content.Substring(0, $startIndex) + $newSections + $content.Substring($endIndex)
Set-Content -Path $filePath -Value $newContent -Encoding UTF8

Write-Host "Successfully restored sections!"
