#Function:PCA
ggscreeplot <- function(pcobj, type = c('pev', 'cev')){
  type <- match.arg(type)
  d <- pcobj$sdev^2
  yvar <- switch(type, 
                 pev = d / sum(d), 
                 cev = cumsum(d) / sum(d))
  
  yvar.lab <- switch(type,
                     pev = 'proportion of explained variance',
                     cev = 'cumulative proportion of explained variance')
  
  df <- data.frame(PC = 1:length(d), yvar = yvar)
  
  ggplot(data = df, aes(x = PC, y = yvar)) + 
    xlab('principal component number') + ylab(yvar.lab) +
    geom_point() + geom_path()
}
ggbiplot <- function(pcobj, choices = 1:2, scale = 1, pc.biplot = TRUE, 
                     obs.scale = 1 - scale, var.scale = scale, 
                     groups = NULL, ellipse = FALSE, ellipse.prob = 0.68, 
                     labels = NULL, labels.size = 3, alpha = 1, 
                     var.axes = TRUE, 
                     circle = FALSE, circle.prob = 0.69, 
                     varname.size = 3, varname.adjust = 1.5, 
                     varname.abbrev = FALSE, ...){
  library(ggplot2)
  library(plyr)
  library(scales)
  library(grid)
  #library(ggforce)
  
  stopifnot(length(choices) == 2)
  
  # Recover the SVD
  if(inherits(pcobj, 'prcomp')){
    nobs.factor <- sqrt(nrow(pcobj$x) - 1)
    d <- pcobj$sdev
    u <- sweep(pcobj$x, 2, 1 / (d * nobs.factor), FUN = '*')
    v <- pcobj$rotation
  } else if(inherits(pcobj, 'princomp')) {
    nobs.factor <- sqrt(pcobj$n.obs)
    d <- pcobj$sdev
    u <- sweep(pcobj$scores, 2, 1 / (d * nobs.factor), FUN = '*')
    v <- pcobj$loadings
  } else if(inherits(pcobj, 'PCA')) {
    nobs.factor <- sqrt(nrow(pcobj$call$X))
    d <- unlist(sqrt(pcobj$eig)[1])
    u <- sweep(pcobj$ind$coord, 2, 1 / (d * nobs.factor), FUN = '*')
    v <- sweep(pcobj$var$coord,2,sqrt(pcobj$eig[1:ncol(pcobj$var$coord),1]),FUN="/")
  } else if(inherits(pcobj, "lda")) {
    nobs.factor <- sqrt(pcobj$N)
    d <- pcobj$svd
    u <- predict(pcobj)$x/nobs.factor
    v <- pcobj$scaling
    d.total <- sum(d^2)
  } else {
    stop('Expected a object of class prcomp, princomp, PCA, or lda')
  }
  
  # Scores
  choices <- pmin(choices, ncol(u))
  df.u <- as.data.frame(sweep(u[,choices], 2, d[choices]^obs.scale, FUN='*'))
  
  # Directions
  v <- sweep(v, 2, d^var.scale, FUN='*')
  df.v <- as.data.frame(v[, choices])
  
  names(df.u) <- c('xvar', 'yvar')
  names(df.v) <- names(df.u)
  
  if(pc.biplot) {
    df.u <- df.u * nobs.factor
  }
  
  # Scale the radius of the correlation circle so that it corresponds to 
  # a data ellipse for the standardized PC scores
  r <- sqrt(qchisq(circle.prob, df = 2)) * prod(colMeans(df.u^2))^(1/4)
  
  # Scale directions
  v.scale <- rowSums(v^2)
  df.v <- r * df.v / sqrt(max(v.scale))
  
  # Change the labels for the axes
  if(obs.scale == 0) {
    u.axis.labs <- paste('standardized PC', choices, sep='')
  } else {
    u.axis.labs <- paste('PC', choices, sep='')
  }
  
  # Append the proportion of explained variance to the axis labels
  u.axis.labs <- paste(u.axis.labs, 
                       sprintf('(%0.1f%% explained var.)', 
                               100 * pcobj$sdev[choices]^2/sum(pcobj$sdev^2)))
  
  # Score Labels
  if(!is.null(labels)) {
    df.u$labels <- labels
  }
  
  # Grouping variable
  if(!is.null(groups)) {
    df.u$groups <- groups
  }
  
  # Variable Names
  if(varname.abbrev) {
    df.v$varname <- abbreviate(rownames(v))
  } else {
    df.v$varname <- rownames(v)
  }
  
  # Variables for text label placement
  df.v$angle <- with(df.v, (180/pi) * atan(yvar / xvar))
  df.v$hjust = with(df.v, (1 - varname.adjust * sign(xvar)) / 2)
  
  # Base plot
  g <- ggplot(data = df.u, aes(x = xvar, y = yvar)) + 
    xlab(u.axis.labs[1]) + ylab(u.axis.labs[2]) + coord_equal()
  
  if(var.axes) {
    # Draw circle
    if(circle) 
    {
      theta <- c(seq(-pi, pi, length = 50), seq(pi, -pi, length = 50))
      circle <- data.frame(xvar = r * cos(theta), yvar = r * sin(theta))
      g <- g + geom_path(data = circle, color = muted('white'), 
                         size = 1/2, alpha = 1/3)
    }
    
    # Draw directions
    g <- g +
      geom_segment(data = df.v,
                   aes(x = 0, y = 0, xend = xvar, yend = yvar),
                   arrow = arrow(length = unit(1/2, 'picas')), 
                   color = muted('red'))
  }
  
  # Draw either labels or points
  if(!is.null(df.u$labels)) {
    if(!is.null(df.u$groups)) {
      #g <- g + geom_text(aes(label = labels, color = groups), 
      #                   size = labels.size)
      g <- g + geom_text(aes(label = labels), size = labels.size,colour="#00468b")      
    } else {
      g <- g + geom_text(aes(label = labels), size = labels.size,colour="#00468b")      
    }
  } else {
    if(!is.null(df.u$groups)) {
      #g <- g + geom_point(aes(color = groups), alpha = alpha,colour="#00468b")
      g <- g + geom_point(alpha = alpha,colour="#00468b")    
      
    } else {
      g <- g + geom_point(alpha = alpha,colour="#00468b")    
    }
  }

  # Overlay a concentration ellipse if there are groups
  if(!is.null(df.u$groups) && ellipse) {
    #theta <- c(seq(-pi, pi, length = 50), seq(pi, -pi, length = 50))
    #circle <- cbind(cos(theta), sin(theta))
    #
    #ell <- ddply(df.u, 'groups', function(x) {
    #  if(nrow(x) <= 2) {
    #    return(NULL)
    #  }
    #  sigma <- var(cbind(x$xvar, x$yvar))
    #  mu <- c(mean(x$xvar), mean(x$yvar))
    #  ed <- sqrt(qchisq(ellipse.prob, df = 2))
    #  data.frame(sweep(circle %*% chol(sigma) * ed, 2, mu, FUN = '+'), 
    #             groups = x$groups[1])
    #})
    #names(ell)[1:2] <- c('xvar', 'yvar')
    #g <- g + geom_path(data = ell, aes(color = groups, group = groups))
    g<-g+ggforce::geom_mark_hull(aes(fill = groups,label = groups),expand = unit(3, "mm"))
    
  }
  
  # Label the variable axes
  if(var.axes) {
    g <- g + 
      geom_text(data = df.v, 
                aes(label = varname, x = xvar, y = yvar, 
                    angle = angle, hjust = hjust), 
                color = 'darkred', size = varname.size,fontface = "bold")
  }
  # Change the name of the legend for groups
  # if(!is.null(groups)) {
  #   g <- g + scale_color_brewer(name = deparse(substitute(groups)), 
  #                               palette = 'Dark2')
  # }
  
  # TODO: Add a second set of axes
  
  return(g)
}

PCA_Prop_Var=function(pr.out){
  library(ggplot2)
  library(gridExtra)
  #The variance explained by each principal component is obtained by squaring these:
  pr.var=pr.out$sdev ^2
  #To compute the proportion of variance explained by each principal component, we simply divide the variance explained by each principal component by the total variance explained by all four principal components:
  pve=pr.var/sum(pr.var)
  #ploting
  par(mfrow=c(1,2))
  a=ggplot(data=data.frame(pve=pve,CP=paste0("CP",1:length(pve))), aes(x=CP, y=pve, group=1)) +
    geom_line(linetype="dashed", color="#00468b", size=.8)+
    geom_point(color="black",fill = "white", size=3,shape = 21)+
    geom_text(aes(label = round(pve,2), color = "#00468b"), 
              size =4,colour="#00468b",nudge_y = .04)+
    xlab("Principal Component") + ylab("Proportion of Variace Explained")+
    ylim(0,1.05)+
    theme_test()
  
  b=ggplot(data=data.frame(pve=cumsum(pve),CP=paste0("CP",1:length(pve))), aes(x=CP, y=pve, group=1)) +
    geom_line(linetype="dashed", color="#00468b", size=.8)+
    geom_point(color="black",fill = "white", size=3,shape = 21)+
    geom_text(aes(label = round(pve,2), color = "#00468b"), 
              size =4,colour="#00468b",nudge_y = .04)+
    xlab("Principal Component") + ylab("Cumulative Prop. Variace Explained")+
    ylim(0,1.05)+
    theme_test()
  return(gridExtra::grid.arrange(a, b, nrow=1, ncol=2))
}
