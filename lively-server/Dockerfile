FROM deitrus/scipyflasknode
ADD ./server /var/www/lively-dev
WORKDIR /var/www/lively-dev
RUN cd $(npm root -g)/npm && \
npm install fs-extra && \
sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js && \
npm cache clean -f && \
npm install -g n
RUN npm install -g forever
RUN n stable
RUN curl -o- https://raw.githubusercontent.com/LivelyKernel/lively.installer/master/web-install.sh | bash
EXPOSE 9011
CMD ["forever", "-c", "bash", "start.sh"]

